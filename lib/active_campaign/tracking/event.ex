defmodule ActiveCampaign.Tracking.Event do
  @moduledoc """
  Documentation for `ActiveCampaign.Tracking.Event`.
  """
  @event_url "https://trackcmp.net/event"

  alias ActiveCampaign.Http
  alias ActiveCampaign.Config

  # @doc """
  # Track event
  # """
  @spec track(String.t(), String.t(), map()) :: {:ok, map()} | {:error, any()}
  def track(event, eventdata, visit) do
    visit_json = Config.json_library().encode!(visit)
    payload = %{
      "actid" => Config.actid(),
      "key" => Config.event_key(),
      "event" => event,
      "eventdata" => eventdata,
      "visit" => visit_json
    }
    header = ["Content-Type": "application/x-www-form-urlencoded"]
    response = Config.http_library().request(:post, @event_url, URI.encode_query(payload), header, Config.http_options())
    Http.parse_response(response)
  end

  @doc """
  Create a new event (name only)
  """
  @spec create(String.t()) :: {:ok, map()} | {:error, any()}
  def create(name) do
    Http.post("eventTrackingEvents", %{eventTrackingEvent: %{name: name}})
  end

  @doc """
  Retrieve Event Tracking Status
  """
  @spec get_status :: {:ok, map()} | {:error, any()}
  def get_status do
    Http.get("eventTracking")
  end

  @doc """
  Enable/disable
  """
  @spec set_enabled(boolean()) :: {:ok, map()} | {:error, any()}
  def set_enabled(bool) do
    Http.put("eventTracking", %{eventTracking: %{enabled: bool}})
  end

  @doc """
  Delete event (name only)

  Spaces in the name should be left as spaces, they will automatically be encoded.
  """
  @spec delete(String.t()) :: {:ok, map()} | {:error, any()}
  def delete(name) do
    Http.delete("eventTrackingEvent/#{URI.encode(name)}")
  end

  @doc """
  List all events (names only)
  """
  @spec list(map()) :: {:ok, map()} | {:error, any()}
  def list(query_params \\ %{}) do
    Http.get("eventTrackingEvents?" <> Http.encode_query(query_params))
  end

  @doc """
  Get Contact's Tracking Logs/Events
  """
  @spec get_contact_tracking(integer()) :: {:ok, map()} | {:error, any()}
  def get_contact_tracking(contact_id) do
    Http.get("contacts/#{contact_id}/trackingLogs")
  end

  @doc """
  Get Contact By Event ID
  """
  @spec get_contact_by_event_id(integer()) :: {:ok, map()} | {:error, any()}
  def get_contact_by_event_id(event_id) do
    Http.get("trackingLogs/#{event_id}/contact")
  end
end
