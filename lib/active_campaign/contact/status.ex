defmodule ActiveCampaign.Contact.Status do
  @moduledoc """
  A contact's status is represented by an integer constant.
  """

  @any -1
  @unconfirmed 0
  @active 1
  @unsubscribed 2
  @bounced 3

  @spec any :: integer()
  def any, do: @any

  @spec unconfirmed :: integer()
  def unconfirmed, do: @unconfirmed

  @spec active :: integer()
  def active, do: @active

  @spec unsubscribed :: integer()
  def unsubscribed, do: @unsubscribed

  @spec bounced :: integer()
  def bounced, do: @bounced
end
