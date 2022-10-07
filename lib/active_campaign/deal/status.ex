defmodule ActiveCampaign.Deal.Status do
  @moduledoc """
  A deal's status is represented by an integer constant.
  """

  @open 0
  @won 1
  @lost 2

  @spec open :: integer()
  def open, do: @open

  @spec won :: integer()
  def won, do: @won

  @spec lost :: integer()
  def lost, do: @lost
end
