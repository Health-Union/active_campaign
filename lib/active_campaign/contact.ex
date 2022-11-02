defmodule ActiveCampaign.Contact do
  @moduledoc """
  Documentation for `ActiveCampaign.Contact`.
  """

  alias ActiveCampaign.Http

  @doc """
  Create a contact

  ## Examples

      iex> ActiveCampaign.Contact.create(%{
        email: "johndoe@example.com",
        firstName: "John",
        lastName: "Doe",
        phone: "7223224241"
      })
      {:ok, %{"contact" => %{...}}}
  """
  @spec create(map()) :: {:ok, map()} | {:error, any()}
  def create(data) do
    Http.post("contacts", %{contact: data})
  end

  @doc """
  Sync a contact's data
  """
  @spec sync(map()) :: {:ok, map()} | {:error, any()}
  def sync(data) do
    Http.post("contacts/sync", %{contact: data})
  end

  @doc """
  Retrieve a contact

  ## Examples
      iex> ActiveCampaign.Contact.get(123)
      {:ok, %{"contactAutomations" => [...], "contactLists" => [...], ...}}
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(id) do
    contact_get(to_string(id))
  end

  @doc """
  Update list status for a contact
  """
  @spec update_list_status(map()) :: {:ok, map()} | {:error, any()}
  def update_list_status(data) do
    Http.post("contactLists", %{"contactList" => data})
  end

  @doc """
  Update a contact
  """
  @spec update(integer(), map()) :: {:ok, map()} | {:error, any()}
  def update(id, data) do
    Http.put("contacts/#{id}", %{contact: data})
  end

  @doc """
  Delete a contact
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(id) do
    Http.delete("contacts/#{id}")
  end

  @doc """
  List, search, and filter contacts
  """
  @spec search(map()) :: {:ok, map()} | {:error, any()}
  def search(query) do
    Http.get("contacts?" <> Http.encode_query(query))
  end

  @doc """
  List all automations the contact is in
  """
  @spec list_automations(integer()) :: {:ok, map()} | {:error, any()}
  def list_automations(id) do
    contact_get("#{id}/contactAutomations")
  end

  @doc """
  Retrieve a contact's score value
  """
  @spec get_score(integer()) :: {:ok, map()} | {:error, any()}
  def get_score(id) do
    contact_get("#{id}/scoreValues")
  end

  @doc """
  Bulk import contacts
  """
  @spec bulk_import(list(map()), map()) :: {:ok, map()} | {:error, any()}
  def bulk_import(contacts, callback \\ %{}) do
    Http.post("import/bulk_import", %{contacts: contacts, callback: callback})
  end

  @doc """
  Bulk import status list

  ## Examples

      iex> ActiveCampaign.Contact.bulk_import_status_list()
      {:ok, %{"outstanding" => [], "recentlyCompleted" => []}}
  """
  @spec bulk_import_status_list() :: {:ok, map()} | {:error, any()}
  def bulk_import_status_list do
    "import/bulk_import"
    |> Http.get()
    |> parse_json()
  end

  @doc """
  Bulk import status info
  """
  @spec bulk_import_status_info(integer()) :: {:ok, map()} | {:error, any()}
  def bulk_import_status_info(batch_id) do
    "import/info?batchId=#{batch_id}"
    |> Http.get()
    |> parse_json()
  end

  @doc """
  List all contact activities
  """
  @spec list_activity(map()) :: {:ok, map()} | {:error, any()}
  def list_activity(query_params \\ %{}) do
    Http.get("activities?" <> Http.encode_query(query_params))
  end

  @doc """
  Retrieve a contact's bounce logs

  ## Examples

      iex> ActiveCampaign.Contact.get_bounce_logs(123)
      {:ok, %{"bounceLogs" => []}}
  """
  @spec get_bounce_logs(integer()) :: {:ok, map()} | {:error, any()}
  def get_bounce_logs(id) do
    contact_get("#{id}/bounceLogs")
  end

  @doc """
  Retrieve a contact's data

  ## Examples

      iex> ActiveCampaign.Contact.get_data(123)
      {:ok, %{"contactDatum" => %{...}}}
  """
  @spec get_data(integer()) :: {:ok, map()} | {:error, any()}
  def get_data(id) do
    contact_get("#{id}/contactData")
  end

  @doc """
  Retrieve a contact's goals

  ## Examples

      iex> ActiveCampaign.Contact.get_goals(123)
      {:ok, %{"contactGoals" => []}}
  """
  @spec get_goals(integer()) :: {:ok, map()} | {:error, any()}
  def get_goals(id) do
    contact_get("#{id}/contactGoals")
  end

  @doc """
  Retrieve a contact's list memberships

  ## Examples

      iex> ActiveCampaign.Contact.get_list_memberships(123)
      {:ok, %{"contactLists" => []}}
  """
  @spec get_list_memberships(integer()) :: {:ok, map()} | {:error, any()}
  def get_list_memberships(id) do
    contact_get("#{id}/contactLists")
  end

  @doc """
  Retrieve a contact's logs

  ## Examples

      iex> ActiveCampaign.Contact.get_logs(123)
      {:ok, %{"contactLogs" => []}}
  """
  @spec get_logs(integer()) :: {:ok, map()} | {:error, any()}
  def get_logs(id) do
    contact_get("#{id}/contactLogs")
  end

  @doc """
  Retrieve a list of contact's deals

  ## Examples

      iex> ActiveCampaign.Contact.get_contact_deals(123)
      {:ok, %{"contactDeals" => []}}
  """
  @spec get_contact_deals(integer()) :: {:ok, map()} | {:error, any()}
  def get_contact_deals(id) do
    contact_get("#{id}/contactDeals")
  end

  @doc """
  Retrieve a contact's deals

  ## Examples

      iex> ActiveCampaign.Contact.get_deals(123)
      {:ok, %{"deals" => []}}
  """
  @spec get_deals(integer()) :: {:ok, map()} | {:error, any()}
  def get_deals(id) do
    contact_get("#{id}/deals")
  end

  @doc """
  Retrieve a contact's field values

  ## Examples

      iex> ActiveCampaign.Contact.get_deals(123)
      {:ok, %{"fieldValues" => []}}
  """
  @spec get_field_values(integer()) :: {:ok, map()} | {:error, any()}
  def get_field_values(id) do
    contact_get("#{id}/fieldValues")
  end

  @doc """
  Retrieve a contacts geo ips

  ## Examples

      iex> ActiveCampaign.Contact.get_geo_ips(123)
      {:ok, %{"geoIps" => []}}
  """
  @spec get_geo_ips(integer()) :: {:ok, map()} | {:error, any()}
  def get_geo_ips(id) do
    contact_get("#{id}/geoIps")
  end

  @doc """
  Retrieve a contacts notes

  ## Examples
      iex> ActiveCampaign.Contact.get_notes(123)
      {:ok, %{"notes" => []}}
  """
  @spec get_notes(integer()) :: {:ok, map()} | {:error, any()}
  def get_notes(id) do
    contact_get("#{id}/notes")
  end

  @doc """
  Retrieve a contacts organization
  """
  @spec get_organization(integer()) :: {:ok, map()} | {:error, any()}
  def get_organization(id) do
    contact_get("#{id}/organization ")
  end

  @doc """
  Retrieve a contacts plus append

  ## Examples

      iex> ActiveCampaign.Contact.get_plus_append(123)
      {:ok, %{}}
  """
  @spec get_plus_append(integer()) :: {:ok, map()} | {:error, any()}
  def get_plus_append(id) do
    contact_get("#{id}/plusAppend")
  end

  @doc """
  Retrieve a contacts tracking logs

  ## Examples

      iex> ActiveCampaign.Contact.get_tracking_logs(123)
      {:ok, %{"trackingLogs" => []}}
  """
  @spec get_tracking_logs(integer()) :: {:ok, map()} | {:error, any()}
  def get_tracking_logs(id) do
    contact_get("#{id}/trackingLogs")
  end

  @doc """
  Retrieve a contacts account contacts

  ## Examples

      iex> ActiveCampaign.Contact.get_account_contacts(123)
      {:ok, %{"accountContacts" => []}}
  """
  @spec get_account_contacts(integer) :: {:ok, map()} | {:error, any()}
  def get_account_contacts(id) do
    contact_get("#{id}/accountContacts")
  end

  @doc """
  Retrieve a contacts automation entry counts

  ## Examples

      iex> ActiveCampaign.Contact.get_automation_entry_counts(123)
      {:ok, %{"automationEntryCounts" => []}}
  """
  @spec get_automation_entry_counts(integer()) :: {:ok, map()} | {:error, any()}
  def get_automation_entry_counts(id) do
    contact_get("#{id}/automationEntryCounts")
  end

  defp contact_get(url_path) do
    Http.get("contacts/" <> url_path)
  end

  # there are some endpoints that should return application/json content types, but don't
  defp parse_json({:ok, str}) when is_binary(str) do
    ActiveCampaign.Config.json_library().decode(str)
  end

  defp parse_json(response), do: response
end
