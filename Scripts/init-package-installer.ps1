Write-Host "Installing NuGet packages for TechConnect solution..." -ForegroundColor Green

# Function to install packages
function Install-Packages {
    param (
        [string]$project,
        [string[]]$packages
    )
    Write-Host "`nInstalling packages for $project" -ForegroundColor Yellow
    foreach ($package in $packages) {
        dotnet add $project package $package
        Write-Host "Added package: $package" -ForegroundColor Cyan
    }
}

# Core Domain Packages
$domainPackages = @(
    "MediatR",
    "FluentValidation",
    "Ardalis.GuardClauses",
    "ErrorOr"
)
Install-Packages "src/Core/TechConnect.Domain/TechConnect.Domain.csproj" $domainPackages

# Core Application Packages
$applicationPackages = @(
    "MediatR",
    "MediatR.Extensions.Microsoft.DependencyInjection",
    "FluentValidation",
    "FluentValidation.DependencyInjectionExtensions",
    "AutoMapper",
    "AutoMapper.Collection",
    "Microsoft.Extensions.DependencyInjection.Abstractions"
)
Install-Packages "src/Core/TechConnect.Application/TechConnect.Application.csproj" $applicationPackages

# Infrastructure Packages
$infrastructurePackages = @(
    "Microsoft.EntityFrameworkCore",
    "Microsoft.EntityFrameworkCore.SqlServer",
    "Microsoft.EntityFrameworkCore.Design",
    "Azure.Storage.Blobs",
    "Microsoft.AspNetCore.Identity.EntityFrameworkCore",
    "StackExchange.Redis",
    "Serilog",
    "Serilog.Sinks.ApplicationInsights",
    "Microsoft.ApplicationInsights.AspNetCore",
    "Azure.Identity",
    "Azure.Security.KeyVault.Secrets"
)
Install-Packages "src/Infrastructure/TechConnect.Infrastructure/TechConnect.Infrastructure.csproj" $infrastructurePackages

# Infrastructure.AI Packages
$infrastructureAIPackages = @(
    "Azure.AI.TextAnalytics",
    "Microsoft.ML",
    "Microsoft.ML.Recommender",
    "Azure.AI.OpenAI",
    "Microsoft.SemanticKernel"
)
Install-Packages "src/Infrastructure/TechConnect.Infrastructure.AI/TechConnect.Infrastructure.AI.csproj" $infrastructureAIPackages

# Common API Packages
$apiPackages = @(
    "Swashbuckle.AspNetCore",
    "Microsoft.AspNetCore.Authentication.JwtBearer",
    "Microsoft.EntityFrameworkCore.Design",
    "Microsoft.ApplicationInsights.AspNetCore",
    "Serilog.AspNetCore",
    "FluentValidation.AspNetCore",
    "MediatR",
    "AutoMapper.Extensions.Microsoft.DependencyInjection"
)

# Install packages for each API project
$apiProjects = @(
    "src/Services/TechConnect.Identity.API/TechConnect.Identity.API.csproj",
    "src/Services/TechConnect.Content.API/TechConnect.Content.API.csproj",
    "src/Services/TechConnect.Community.API/TechConnect.Community.API.csproj",
    "src/Services/TechConnect.Analytics.API/TechConnect.Analytics.API.csproj",
    "src/Services/TechConnect.AI.API/TechConnect.AI.API.csproj"
)

foreach ($project in $apiProjects) {
    Install-Packages $project $apiPackages
}

# Blazor Client Packages
$blazorClientPackages = @(
    "Microsoft.AspNetCore.Components.WebAssembly",
    "Microsoft.AspNetCore.Components.WebAssembly.DevServer",
    "Microsoft.AspNetCore.Components.WebAssembly.Authentication",
    "Microsoft.Extensions.Http",
    "MudBlazor",
    "Blazored.LocalStorage",
    "Microsoft.ApplicationInsights.Blazor"
)
Install-Packages "src/Web/TechConnect.Blazor.Client/TechConnect.Blazor.Client.csproj" $blazorClientPackages

# Admin Server Packages
$adminServerPackages = @(
    "Microsoft.AspNetCore.Components.Server",
    "Microsoft.AspNetCore.Identity.UI",
    "MudBlazor"
)
Install-Packages "src/Web/TechConnect.Admin.Server/TechConnect.Admin.Server.csproj" $adminServerPackages

# Shared Packages
$sharedPackages = @(
    "FluentValidation",
    "ErrorOr"
)
Install-Packages "src/Shared/TechConnect.Shared.Contracts/TechConnect.Shared.Contracts.csproj" $sharedPackages
Install-Packages "src/Shared/TechConnect.Shared.Common/TechConnect.Shared.Common.csproj" $sharedPackages

# Test Packages
$testPackages = @(
    "Microsoft.NET.Test.Sdk",
    "xunit",
    "xunit.runner.visualstudio",
    "Moq",
    "FluentAssertions",
    "Bogus",
    "Microsoft.EntityFrameworkCore.InMemory",
    "AutoFixture",
    "AutoFixture.AutoMoq",
    "AutoFixture.Xunit2"
)

$testProjects = @(
    "tests/UnitTests/TechConnect.Domain.Tests/TechConnect.Domain.Tests.csproj",
    "tests/UnitTests/TechConnect.Application.Tests/TechConnect.Application.Tests.csproj",
    "tests/UnitTests/TechConnect.Infrastructure.Tests/TechConnect.Infrastructure.Tests.csproj",
    "tests/IntegrationTests/TechConnect.API.IntegrationTests/TechConnect.API.IntegrationTests.csproj",
    "tests/IntegrationTests/TechConnect.AI.IntegrationTests/TechConnect.AI.IntegrationTests.csproj",
    "tests/E2ETests/TechConnect.Web.E2ETests/TechConnect.Web.E2ETests.csproj"
)

foreach ($project in $testProjects) {
    Install-Packages $project $testPackages
}

# Install global tools
Write-Host "`nInstalling global tools..." -ForegroundColor Green
dotnet tool install --global dotnet-ef
dotnet tool install --global dotnet-outdated-tool

Write-Host "`nAll packages installed successfully!" -ForegroundColor Green
Write-Host "Next steps: Configure project references and start development" -ForegroundColor Cyan