# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY JBBakery.Web/*.csproj ./JBBakery.Web/
RUN dotnet restore ./JBBakery.Web/JBBakery.Web.csproj

COPY . .
WORKDIR /src/JBBakery.Web
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://0.0.0.0:${PORT}

EXPOSE 8080

ENTRYPOINT ["dotnet", "JBBakery.Web.dll"]