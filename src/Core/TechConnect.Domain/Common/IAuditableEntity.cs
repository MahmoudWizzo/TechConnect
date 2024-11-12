namespace TechConnect.Domain.Common;

/// <summary>
/// Interface for entities that need audit tracking.
/// Implements basic audit fields like creation and modification timestamps.
/// </summary>
public interface IAuditableEntity
{
    DateTime CreatedOnUtc { get; set; }
    string CreatedBy { get; set; }
    DateTime? LastModifiedOnUtc { get; set; }
    string? LastModifiedBy { get; set; }
}

/// <summary>
/// Base implementation of auditable entity.
/// Combines entity behavior with audit tracking.
/// </summary>
public abstract class AuditableEntity<TId> : Entity<TId>, IAuditableEntity
{
    public DateTime CreatedOnUtc { get; set; }
    public string CreatedBy { get; set; } = string.Empty;
    public DateTime? LastModifiedOnUtc { get; set; }
    public string? LastModifiedBy { get; set; }

    protected AuditableEntity(TId id) : base(id) { }
    protected AuditableEntity() { } // For EF Core
}