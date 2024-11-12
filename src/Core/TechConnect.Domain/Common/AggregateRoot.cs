namespace TechConnect.Domain.Common;

/// <summary>
/// Base class for aggregate roots in the domain.
/// Aggregate roots are entities that are the main entry point to a group of related objects.
/// They maintain consistency boundaries and handle domain events.
/// </summary>
public abstract class AggregateRoot<TId> : Entity<TId>
{
    private readonly List<IDomainEvent> _domainEvents = new();

    protected AggregateRoot(TId id) : base(id) { }

    protected AggregateRoot() { } // For EF Core

    /// <summary>
    /// Gets the domain events that occurred.
    /// </summary>
    public IReadOnlyList<IDomainEvent> DomainEvents => _domainEvents.AsReadOnly();

    /// <summary>
    /// Adds a domain event to be processed later.
    /// </summary>
    protected void AddDomainEvent(IDomainEvent domainEvent)
    {
        _domainEvents.Add(domainEvent);
    }

    /// <summary>
    /// Clears all domain events.
    /// </summary>
    public void ClearDomainEvents()
    {
        _domainEvents.Clear();
    }
}