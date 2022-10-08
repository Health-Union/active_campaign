defmodule ActiveCampaign.Contact.Tag do
  @moduledoc """
  Documentation for `ActiveCampaign.Contact.Tag`.
  """

  alias ActiveCampaign.Http

  @doc """
  Add a tag to contact
  """
  @spec add(integer(), integer()) :: {:ok, map()} | {:error, any()}
  def add(contact_id, tag_id) do
    Http.post("contactTags", %{contactTag: %{contact: contact_id, tag: tag_id}})
  end

  @doc """
  Remove a tag from a contact
  """
  @spec delete(integer()) :: {:ok, map()} | {:error, any()}
  def delete(contact_tag_id) do
    Http.delete("contactTags/#{contact_tag_id}")
  end
end
