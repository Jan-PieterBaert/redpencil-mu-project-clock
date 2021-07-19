alias Acl.Accessibility.Always, as: AlwaysAccessible
alias Acl.Accessibility.ByQuery, as: AccessByQuery
alias Acl.GraphSpec.Constraint.Resource.AllPredicates, as: AllPredicates
alias Acl.GraphSpec.Constraint.Resource.NoPredicates, as: NoPredicates
alias Acl.GraphSpec.Constraint.ResourceFormat, as: ResourceFormatConstraint
alias Acl.GraphSpec.Constraint.Resource, as: ResourceConstraint
alias Acl.GraphSpec, as: GraphSpec
alias Acl.GroupSpec, as: GroupSpec
alias Acl.GroupSpec.GraphCleanup, as: GraphCleanup

defmodule Acl.UserGroups.Config do
  def user_groups do
    [
      # // PUBLIC
      %GroupSpec{
        name: "public",
        useage: [:write, :read, :read_for_write],
        access: %AlwaysAccessible{},
        graphs: [
                  %GraphSpec{
                      graph: "http://mu.semte.ch/graphs/public",
                      constraint: %ResourceConstraint{
                        resource_types: [
                          "http://mu.semte.ch/vocabularies/cache/CacheClear",
                          "http://mu.semte.ch/vocabularies/push/PushUpdate",
                          "http://schema.org/Car"
                        ]
                      } } ]
        },
      %GraphCleanup{
        originating_graph: "http://mu.semte.ch/application",
        useage: [:write],
        name: "clean"
      }
    ]
  end
end
