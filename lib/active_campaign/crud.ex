defmodule ActiveCampaign.Crud do
  @moduledoc """
  Common aliases for endpoint modules.
  Provides macros for generating boilerplate CRUD endpoints
  """
  defmacro __using__(opts) do
    aliases =
      quote do
        alias ActiveCampaign.Http
      end

    [aliases] ++ Enum.map(opts[:fun], fn fun -> apply(__MODULE__, fun, [opts]) end)
  end

  def get(opts) do
    quote do
      @doc """
      Retrieve a #{unquote(name(opts))}
      """
      @spec get(integer()) :: {:ok, map()} | {:error, any()}
      def get(id) do
        Http.get(unquote(opts[:endpoint]) <> "/" <> to_string(id))
      end
    end
  end

  def create(opts) do
    quote do
      @doc """
      Create a #{unquote(name(opts))}
      """
      @spec create(map()) :: {:ok, map()} | {:error, any()}
      def create(unquote(Macro.var(opts[:key], nil))) do
        Http.post(unquote(opts[:endpoint]), %{
          unquote(opts[:key]) => unquote(Macro.var(opts[:key], nil))
        })
      end
    end
  end

  def update(opts) do
    quote do
      @doc """
      Update a #{unquote(name(opts))}
      """
      @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
      def update(id, unquote(Macro.var(opts[:key], nil))) do
        Http.put(unquote(opts[:endpoint]) <> "/" <> to_string(id), %{
          unquote(opts[:key]) => unquote(Macro.var(opts[:key], nil))
        })
      end
    end
  end

  def delete(opts) do
    quote do
      @doc """
      Delete a #{unquote(name(opts))}
      """
      @spec delete(integer()) :: {:ok, map()} | {:error, any()}
      def delete(id) do
        Http.delete(unquote(opts[:endpoint]) <> "/" <> to_string(id))
      end
    end
  end

  def list(opts) do
    quote do
      @doc """
      List all #{unquote(name(opts))}s
      """
      @spec list(map()) :: {:ok, map()} | {:error, any()}
      def list(query_params \\ %{}) do
        Http.get(unquote(opts[:endpoint]) <> "?" <> Http.encode_query(query_params))
      end
    end
  end

  defp name(opts) do
    opts[:name] || opts[:key]
  end
end
