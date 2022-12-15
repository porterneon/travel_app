FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["TravelAppApi/TravelAppApi.csproj", "TravelAppApi/"]
RUN dotnet restore "TravelAppApi/TravelAppApi.csproj"
COPY . .
WORKDIR "/src/TravelAppApi"
RUN dotnet build "TravelAppApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TravelAppApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TravelAppApi.dll"]
