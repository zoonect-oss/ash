defmodule Ash.Registry.Transformers.WarnOnEmpty do
  @moduledoc "Warns if a registry has no entries in it"
  use Ash.Dsl.Transformer

  def transform(registry, dsl) do
    if Ash.Registry.warn_on_empty?(registry) do
      case Ash.Registry.entries(registry) do
        [] ->
          {:warn, dsl, "#{inspect(registry)} has no entries."}

        _ ->
          {:ok, dsl}
      end
    else
      {:ok, dsl}
    end
  end
end