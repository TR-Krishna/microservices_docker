# Build stage
#FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
#WORKDIR /src

# Copy only csproj first (for caching)
#COPY DemoApi2.csproj ./


#  Restore dependencies
#RUN dotnet restore --no-cache

# Copy full project
#COPY . ./
#RUN dotnet publish -c Release -o /app/publish --no-restore


# Runtime stage
#FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
#WORKDIR /app

#COPY --from=build /app/publish .
#EXPOSE 8080
#ENV ASPNETCORE_URLS=http://+:8080
#ENV ASPNETCORE_ENVIRONMENT=Production

#ENTRYPOINT ["dotnet", "DemoApi2.dll"]

# Build stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 
WORKDIR /app
COPY ./publish .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080
ENTRYPOINT ["dotnet", "DemoApi2.dll"]

#FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
#WORKDIR /src
#COPY . .
#RUN dotnet publish -c Release -o /app/publish

#FROM mcr.microsoft.com/dotnet/aspnet:8.0
#WORKDIR /app
#COPY --from=build /app/publish .
#EXPOSE 8080
#ENV ASPNETCORE_URLS=http://+:8080
#ENTRYPOINT ["dotnet", "DemoApi2.dll"]