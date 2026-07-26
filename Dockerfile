FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY . ./

ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production
EXPOSE 8080

ENTRYPOINT ["sh", "-c", "DLL=$(find . -name 'SamyakCRM.API.dll' | head -n 1); echo \"Found API DLL at: $DLL\"; dotnet \"$DLL\""]
