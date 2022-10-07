defmodule ActiveCampaign.Contact.CustomField do
  alias ActiveCampaign.Http

  @doc """
  Create a custom field
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(field) do
    Http.post("fields", %{field: field})
  end

  @doc """
  Retrieve a custom field

  ## Examples

      iex> ActiveCampaign.Contact.CustomField.get(1)
      {:ok, %{"field" => %{...}}}
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    Http.get("fields/#{id}")
  end

  @doc """
  Update a custom field
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, field) do
    Http.put("fields/#{id}", %{field: field})
  end

  @doc """
  Delete a custom field
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("fields/#{id}")
  end

  @doc """
  List all custom fields

  ## Examples

      iex> ActiveCampaign.Branding.list()
      {:ok, %{"fieldOptions" => [...], "fieldRels" => [...], "fields" => [...], "meta" => [...]}}
  """
  @spec list :: {:ok, map()} | {:error, any()}
  def list do
    Http.get("fields")
  end

  @doc """
  Create a custom field relationship to list(s)

  Setting `list_id` to `0` makes the field available on all lists.
  """
  @spec create_field_relationship(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def create_field_relationship(field_id, list_id) do
    Http.post("fieldRels", %{fieldRel: %{field: field_id, relid: list_id}})
  end

  @doc """
  Bulk create custom field options
  """
  @spec create_field_options(map()) :: {:ok, map()} | {:error, any()}
  def create_field_options(field_options) do
    Http.post("fieldOption/bulk", %{fieldOptions: field_options})
  end

  @doc """
  Delete a custom field relationship to list(s)
  """
  @spec delete_field_relationship(integer()) :: {:ok, map()} | {:error, any()}
  def delete_field_relationship(field_relationship_id) do
    Http.delete("fieldRels/#{field_relationship_id}")
  end

end
