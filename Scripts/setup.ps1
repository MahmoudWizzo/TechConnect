# Create main directories
$directories = @(
    "src/Core/TechConnect.Domain",
    "src/Core/TechConnect.Application",
    "src/Infrastructure/TechConnect.Infrastructure",
    "src/Infrastructure/TechConnect.Infrastructure.AI",
    "src/Services/TechConnect.Identity.API",
    "src/Services/TechConnect.Content.API",
    "src/Services/TechConnect.Community.API",
    "src/Services/TechConnect.Analytics.API",
    "src/Services/TechConnect.AI.API",
    "src/Web/TechConnect.Blazor.Client",
    "src/Web/TechConnect.Admin.Server",
    "src/Shared/TechConnect.Shared.Contracts",
    "src/Shared/TechConnect.Shared.Common",
    "tests/UnitTests/TechConnect.Domain.Tests",
    "tests/UnitTests/TechConnect.Application.Tests",
    "tests/UnitTests/TechConnect.Infrastructure.Tests",
    "tests/IntegrationTests/TechConnect.API.IntegrationTests",
    "tests/IntegrationTests/TechConnect.AI.IntegrationTests",
    "tests/E2ETests/TechConnect.Web.E2ETests"
)

Write-Host "Creating solution structure..." -ForegroundColor Green

# Create solution
dotnet new sln -n TechConnect
Write-Host "Created solution file" -ForegroundColor Yellow

# Create directories and projects
foreach ($dir in $directories) {
    # Create directory if it doesn't exist
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir
        Write-Host "Created directory: $dir" -ForegroundColor Yellow
    }
}

# Create projects
Write-Host "Creating projects..." -ForegroundColor Green

# Core Projects
Set-Location src/Core/TechConnect.Domain
dotnet new classlib -f net8.0
Set-Location ../TechConnect.Application
dotnet new classlib -f net8.0

# Infrastructure Projects
Set-Location ../../Infrastructure/TechConnect.Infrastructure
dotnet new classlib -f net8.0
Set-Location ../TechConnect.Infrastructure.AI
dotnet new classlib -f net8.0

# Service Projects
Set-Location ../../Services/TechConnect.Identity.API
dotnet new webapi -f net8.0
Set-Location ../TechConnect.Content.API
dotnet new webapi -f net8.0
Set-Location ../TechConnect.Community.API
dotnet new webapi -f net8.0
Set-Location ../TechConnect.Analytics.API
dotnet new webapi -f net8.0
Set-Location ../TechConnect.AI.API
dotnet new webapi -f net8.0

# Web Projects
Set-Location ../../Web/TechConnect.Blazor.Client
dotnet new blazorwasm -f net8.0
Set-Location ../TechConnect.Admin.Server
dotnet new web -f net8.0

# Shared Projects
Set-Location ../../Shared/TechConnect.Shared.Contracts
dotnet new classlib -f net8.0
Set-Location ../TechConnect.Shared.Common
dotnet new classlib -f net8.0

# Test Projects
Set-Location ../../../tests/UnitTests/TechConnect.Domain.Tests
dotnet new xunit -f net8.0
Set-Location ../TechConnect.Application.Tests
dotnet new xunit -f net8.0
Set-Location ../TechConnect.Infrastructure.Tests
dotnet new xunit -f net8.0
Set-Location ../../IntegrationTests/TechConnect.API.IntegrationTests
dotnet new xunit -f net8.0
Set-Location ../TechConnect.AI.IntegrationTests
dotnet new xunit -f net8.0
Set-Location ../../E2ETests/TechConnect.Web.E2ETests
dotnet new xunit -f net8.0

# Return to root
Set-Location ../../..

Write-Host "Adding projects to solution..." -ForegroundColor Green

# Add all projects to solution
$projects = Get-ChildItem -Recurse -Filter *.csproj
foreach ($project in $projects) {
    dotnet sln add $project.FullName
    Write-Host "Added project: $($project.Name)" -ForegroundColor Yellow
}

# Create standard folders in projects
$standardFolders = @{
    "src/Core/TechConnect.Domain" = @("Aggregates", "Entities", "ValueObjects", "Events", "Interfaces")
    "src/Core/TechConnect.Application" = @("Commands", "Queries", "DTOs", "Interfaces", "Behaviors")
    "src/Infrastructure/TechConnect.Infrastructure" = @("Persistence", "Identity", "Storage", "Messaging")
    "src/Infrastructure/TechConnect.Infrastructure.AI" = @("Services", "Models")
}

foreach ($project in $standardFolders.Keys) {
    foreach ($folder in $standardFolders[$project]) {
        $path = Join-Path $project $folder
        if (!(Test-Path $path)) {
            New-Item -ItemType Directory -Force -Path $path
            Write-Host "Created standard folder: $path" -ForegroundColor Yellow
        }
    }
}

Write-Host "Solution setup complete!" -ForegroundColor Green
Write-Host "Next steps: Add NuGet packages and configure project references" -ForegroundColor Cyan