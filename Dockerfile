# ============================================================
# NIMBLE CRM & ERP - Multi-Stage Production Dockerfile
# Builds React Frontend + .NET 9 API Web Server into single image
# ============================================================

# --- Stage 1: Build React Frontend ---
FROM node:20-alpine AS frontend-builder
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm ci
COPY frontend/ ./
RUN npm run build

# --- Stage 2: Build .NET 9 Backend API ---
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS backend-builder
WORKDIR /src
COPY CRM/src/SamyakCRM.Domain/ SamyakCRM.Domain/
COPY CRM/src/SamyakCRM.Application/ SamyakCRM.Application/
COPY CRM/src/SamyakCRM.Infrastructure/ SamyakCRM.Infrastructure/
COPY CRM/src/SamyakCRM.API/ SamyakCRM.API/
RUN dotnet publish SamyakCRM.API/SamyakCRM.API.csproj -c Release -o /app/publish

# --- Stage 3: Production Runtime ---
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=backend-builder /app/publish ./
COPY --from=frontend-builder /app/frontend/dist ./wwwroot

ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production
EXPOSE 8080

ENTRYPOINT ["dotnet", "SamyakCRM.API.dll"]
