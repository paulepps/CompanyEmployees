FROM mcr.microsoft.com/dotnet/sdk:7.0 as build-image
WORKDIR /home/app
COPY ./CompanyEmployees/CompanyEmployees.csproj ./CompanyEmployees/
COPY ./CompanyEmployees.Presentation/CompanyEmployees.Presentation.csproj ./CompanyEmployees.Presentation/
COPY ./Contracts/Contracts.csproj ./Contracts/
COPY ./Entities/Entities.csproj ./Entities/
COPY ./LoggerService/LoggerService.csproj ./LoggerService/
COPY ./Repository/Repository.csproj ./Repository/
COPY ./Service/Service.csproj ./Service/
COPY ./Service.Contracts/Service.Contracts.csproj ./Service.Contracts/
COPY ./Shared/Shared.csproj ./Shared/
COPY ./Tests/Tests.csproj ./Tests/
COPY ./CompanyEmployees.sln .
RUN dotnet restore
COPY . .
RUN dotnet test ./Tests/Tests.csproj
RUN dotnet publish ./CompanyEmployees/CompanyEmployees.csproj -o /publish/
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /publish
COPY --from=build-image /publish .
ENV ASPNETCORE_URLS=https://+:5001;http://+:5000
ENTRYPOINT ["dotnet", "CompanyEmployees.dll"]