defmodule ActiveCampaign.Http do
  @moduledoc """
  The HTTP interface for interacting with the Active Campaign API.
  """

  alias ActiveCampaign.Config

  @spec delete(String.t()) :: {:ok, any()} | {:error, any()}
  def delete(url_path) do
    request(:delete, url_path)
  end

  @spec post(String.t(), any()) :: {:ok, any()} | {:error, any()}
  def post(url_path, body \\ "") do
    request(:post, url_path, body)
  end

  @spec put(String.t(), any()) :: {:ok, any()} | {:error, any()}
  def put(url_path, body) do
    request(:put, url_path, body)
  end

  @spec patch(String.t(), any()) :: {:ok, any()} | {:error, any()}
  def patch(url_path, body) do
    request(:patch, url_path, body)
  end

  @spec get(String.t()) :: {:ok, any()} | {:error, any()}
  def get(url_path) do
    request(:get, url_path)
  end

  @doc """
  Encodes URL query params.

  This differs from `URI.encode_query/2` in the following ways:
  - It will encode nested maps
  - It always assumes `:www_form` encoding
  - It assumes keys do not always need to be `:www_form` encoded
  - It assume there are no maps inside lists when the map has 0 or more than 1 element

  ## Examples

      iex> iex> ActiveCampaign.Http.encode_query(%{a: %{b: :c}, d: :e})
      "a[b]=c&d=e"

      iex> ActiveCampaign.Http.encode_query(%{ids: [1, 2, 3]})
      "ids[]=1&ids[]=2&ids[]=3"
  """
  @spec encode_query(map()) :: String.t()
  def encode_query(enumerable) do
    Enum.map_join(enumerable, "&", &encode_kv_pair/1)
  end

  def parse_response({:ok, %{body: body, headers: headers}}) do
    if {"Content-Type", "application/json"} in headers do
      Config.json_library().decode(body)
    else
      {:ok, body}
    end
  end

  def parse_response(error), do: error

  defp encode_kv_pair({key, value}) when is_list(value) do
    Enum.map_join(value, "&", fn v -> encode_kv_pair({"#{key}[]", v}) end)
  end

  defp encode_kv_pair({key, value}) when is_map(value) do
    Enum.map_join(value, "&", fn {k, v} -> encode_kv_pair({"#{key}[#{encode_string(k)}]", v}) end)
  end

  defp encode_kv_pair({key, value}) do
    to_string(key) <> "=" <> encode_string(value)
  end

  defp encode_string(str) do
    str
    |> to_string()
    |> URI.encode_www_form()
  end

  defp request(method, url_path, body \\ "") do
    url = build_url(url_path)
    body = encode_body(body)

    method
    |> Config.http_library().request(url, body, headers(), Config.http_options())
    |> parse_response()
  end

  defp encode_body(body) when is_map(body) do
    Config.json_library().encode!(body)
  end

  defp encode_body(body), do: body

  defp headers do
    ["Api-Token": Config.api_key()]
  end

  defp build_url(url_path) do
    Config.api_url()
    |> URI.merge(url_path)
  end
end
