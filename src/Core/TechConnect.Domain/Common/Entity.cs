namespace TechConnect.Domain.Common;

/// <summary>
/// Base class for entities that have an identity and are trackable.
/// Entities are objects that we care about tracking and persistence.
/// Two entities are equal if they have the same ID, regardless of other properties.
/// </summary>
public abstract class Entity<TId>
{
    public TId Id { get; protected set; }

    protected Entity(TId id)
    {
        Id = id;
    }

    protected Entity() { } // For EF Core

    public override bool Equals(object? obj)
    {
        if (obj is null || obj is not Entity<TId> entity)
            return false;

        return entity.Id.Equals(Id);
    }

    public override int GetHashCode()
    {
        return Id.GetHashCode();
    }

    public static bool operator ==(Entity<TId>? left, Entity<TId>? right)
    {
        return left is not null && right is not null && left.Equals(right);
    }

    public static bool operator !=(Entity<TId>? left, Entity<TId>? right)
    {
        return !(left == right);
    }
}
