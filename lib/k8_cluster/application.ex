defmodule K8Cluster.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: K8Cluster.Supervisor]

    Supervisor.start_link(children(), opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    K8ClusterWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp children do
    [
      {Cluster.Supervisor,
       [Application.get_env(:libcluster, :topologies), [name: MyApp.ClusterSupervisor]]},
      K8ClusterWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:k8_cluster, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: K8Cluster.PubSub},
      # Start a worker by calling: K8Cluster.Worker.start_link(arg)
      # {K8Cluster.Worker, arg},
      # Start to serve requests, typically the last entry
      K8ClusterWeb.Endpoint
    ]
  end
end
