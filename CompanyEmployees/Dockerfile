#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /home/app
COPY . . 
RUN dotnet restore
RUN dotnet publish ./CompanyEmployees/CompanyEmployees.csproj -o /publish/
WORKDIR /publish
ENV ASPNETCORE_URLS=https://+:5001;http://+:5000
ENTRYPOINT ["dotnet", "CompanyEmployees.dll"]