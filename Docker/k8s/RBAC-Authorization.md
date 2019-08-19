## Service Account

- A Service Account contains mountable secrets
- A ServiceAccount can also contain a list of image pull Secrets that hold the credentials for pulling container images from a private image repository

## Role-based access control (RBAC)

RBAC uses the `rbac.authorization.k8s.io` API

RBAC API declares 4 top-level types which can be grouped into 2 groups:

- Roles and ClusterRoles, which specify which verbs can be performed on which resources.
- RoleBindings and ClusterRoleBindings, which bind the above roles to specific users, groups, or ServiceAccounts.

Roles and RoleBindings are namespace resources

ClusterRoles and ClusterRoleBindings are cluster-level resources

Permissions are purely additive (there are no “deny” rules)

## NOTES

In addition to RBAC, Kubernetes also includes other authorization plugins, such as the Attribute-based access control (ABAC) plugin, a Web-Hook plugin and custom plugin implementations. RBAC is the standard, though.
