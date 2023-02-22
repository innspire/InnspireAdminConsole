FROM mcr.microsoft.com/dotnet/sdk:7.0-alpine AS build
WORKDIR /src
COPY . ./
RUN dotnet restore "./src/InspireAdminConsole.csproj"
WORKDIR "/src/src"
RUN dotnet build "InspireAdminConsole.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "InspireAdminConsole.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM nginx:alpine AS final
WORKDIR /usr/share/nginx/html
COPY --from=publish /app/publish/wwwroot/ .
COPY ./build/nginx.conf /etc/nginx/nginx.conf