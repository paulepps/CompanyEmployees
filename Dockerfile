FROM mcr.microsoft.com/dotnet/sdk:5.0 as build-image
WORKDIR /app 
COPY ./*.sln ./ 
COPY ./*/*.csproj ./ 
RUN for file in $(ls *.csproj); do mkdir -p ./${file%.*}/ && mv $file ./${file%.*}/; done
RUN dotnet restore 
COPY . . 
RUN dotnet publish ./CompanyEmployees/CompanyEmployees.csproj -o out 
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build-image /app/out .
ENTRYPOINT ["dotnet", "CompanyEmployees.dll"]