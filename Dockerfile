# Use the official .NET Core runtime as the base image
FROM mcr.microsoft.com/dotnet/aspnet:6.0

# Set the working directory
WORKDIR /app

# Copy the published application files from the workflow artifacts directory
COPY src/HelloWorldApp/myapp/ .

# Start the application
ENTRYPOINT ["dotnet", "HelloWorldApp.dll"]
