defmodule ActiveCampaign.Contact.Automation do
  alias ActiveCampaign.Http

  @doc """
  Add a contact to an automation
  """
  @spec add(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def add(contact_id, automation_id) do
    Http.post("contactAutomations", %{
      contactAutomation: %{contact: contact_id, automation: automation_id}
    })
  end

  @doc """
  Retrieve an automation a contact is in
  """
  @spec get(integer()) :: {:ok, map()} | {:error, any()}
  def get(contact_automation_id) do
    Http.get("contactAutomations/#{contact_automation_id}")
  end

  @doc """
  Remove a contact from an automation
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(contact_automation_id) do
    Http.delete("contactAutomations/#{contact_automation_id}")
  end

  @doc """
  List all automations a contact is in

  ## Examples

      iex> ActiveCampaign.Contact.Automation.list()
      {:ok, %{"contactAutomations" => [...], "meta" => %{}}}
  """
  @spec list :: {:ok, map()} | {:error, any()}
  def list do
    Http.get("contactAutomations")
  end
end
