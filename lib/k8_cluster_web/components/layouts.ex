defmodule K8ClusterWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use K8ClusterWeb, :controller` and
  `use K8ClusterWeb, :live_view`.
  """
  use K8ClusterWeb, :html

  embed_templates "layouts/*"
end
