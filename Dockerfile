FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . ./

ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production
EXPOSE 8080

ENTRYPOINT ["sh", "-c", "find . -name '*.zip' -exec unzip -o {} -d /app \\;; DLL=$(find /app -name 'SamyakCRM.API.dll' | head -n 1); echo \"Found API DLL at: $DLL\"; dotnet \"$DLL\""]
