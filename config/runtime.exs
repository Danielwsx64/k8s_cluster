import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.

# ## Using releases
#
# If you use `mix release`, you need to explicitly enable the server
# by passing the PHX_SERVER=true when you start it:
#
#     PHX_SERVER=true bin/k8_cluster start
#
# Alternatively, you can use `mix phx.gen.release` to generate a `bin/server`
# script that automatically sets the env var above.
if System.get_env("PHX_SERVER") do
  config :k8_cluster, K8ClusterWeb.Endpoint, server: true
end

if config_env() == :prod do
  # The secret key base is used to sign/encrypt cookies and other secrets.
  # A default value is used in config/dev.exs and config/test.exs but you
  # want to use a different value for prod and you most likely don't want
  # to check this value into version control, so we use an environment
  # variable instead.
  secret_key_base = System.fetch_env!("SECRET_KEY_BASE")

  host = System.fetch_env!("PHX_HOST")
  port = String.to_integer(System.fetch_env!("PHX_PORT"))

  config :k8_cluster, :dns_cluster_query, System.fetch_env!("DNS_CLUSTER_QUERY")

  config :k8_cluster, K8ClusterWeb.Endpoint,
    secret_key_base: secret_key_base,
    url: [host: host, scheme: "https"],
    http: [port: port],
    # TODO: change to get k8s service host
    check_origin: false

  config :libcluster,
    topologies: [
      erlang_nodes_in_k8s: [
        strategy: Elixir.Cluster.Strategy.Kubernetes.DNS,
        config: [
          service: "k8-cluster-headless-service",
          application_name: "k8_cluster",
          polling_interval: 10_000
        ]
      ]
    ]
end
