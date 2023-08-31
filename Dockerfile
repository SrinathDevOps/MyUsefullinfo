# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY src/HelloWorldApp/Helloworldapp.web/Helloworldapp.web.csproj .
RUN dotnet restore
COPY src/HelloWorldApp .
RUN dotnet publish -c Release Release --output ./src/HelloWorldApp/myapp

# Stage 2: Create the final runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "HelloWorldApp.dll"]

