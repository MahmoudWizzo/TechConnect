# Shared projects references
dotnet add src/Core/TechConnect.Domain/TechConnect.Domain.csproj reference src/Shared/TechConnect.Shared.Contracts/TechConnect.Shared.Contracts.csproj
dotnet add src/Core/TechConnect.Application/TechConnect.Application.csproj reference src/Shared/TechConnect.Shared.Contracts/TechConnect.Shared.Contracts.csproj

# Web projects references
dotnet add src/Web/TechConnect.Blazor.Client/TechConnect.Blazor.Client.csproj reference src/Shared/TechConnect.Shared.Contracts/TechConnect.Shared.Contracts.csproj
dotnet add src/Web/TechConnect.Blazor.Client/TechConnect.Blazor.Client.csproj reference src/Shared/TechConnect.Shared.Common/TechConnect.Shared.Common.csproj

dotnet add src/Web/TechConnect.Admin.Server/TechConnect.Admin.Server.csproj reference src/Shared/TechConnect.Shared.Contracts/TechConnect.Shared.Contracts.csproj
dotnet add src/Web/TechConnect.Admin.Server/TechConnect.Admin.Server.csproj reference src/Shared/TechConnect.Shared.Common/TechConnect.Shared.Common.csproj
dotnet add src/Web/TechConnect.Admin.Server/TechConnect.Admin.Server.csproj reference src/Infrastructure/TechConnect.Infrastructure/TechConnect.Infrastructure.csproj

# AI Service specific references
dotnet add src/Services/TechConnect.AI.API/TechConnect.AI.API.csproj reference src/Infrastructure/TechConnect.Infrastructure.AI/TechConnect.Infrastructure.AI.csproj