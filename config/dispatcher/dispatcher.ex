defmodule Dispatcher do
  use Matcher

  define_accept_types [
    html: [ "text/html", "application/xhtml+html" ],
    json: [ "application/json", "application/vnd.api+json" ],
  ]

  @any %{}
  @json %{ accept: %{ json: true } }
  @html %{ accept: %{ html: true } }

  # In order to forward the 'themes' resource to the
  # resource service, use the following forward rule.
  #
  # docker-compose stop; docker-compose rm; docker-compose up
  # after altering this file.

  match "/cars/*path", @json do
    Proxy.forward conn, path, "http://resource_cache/cars/"
  end

  match "/cache_clear/*path", @any do
    Proxy.forward conn, path, "http://cache_clear/cache-clear/"
  end

  match "/uuid/*path", @any do
    Proxy.forward conn, path, "http://uuid/uuid/"
  end

  match "/push-update-ws/*path", @any do
    ws(conn, "ws://push_updates_ws:3456")
  end

  match "/push-update/*path", @any do
    Proxy.forward conn, path, "http://push_updates/push-update/"
  end

  match "/clock/*path", @any do
    Proxy.forward conn, path, "http://clock_backend/clock/"
  end

  match "/messages/*path", @any do
    Proxy.forward conn, path, "http://chat_backend/messages/"
  end

  match "/garage/*path", @html do
    Proxy.forward conn, path, "http://ember_cars/"
  end

  match "/*path", @html do
    Proxy.forward conn, path, "http://ember_clock/"
  end

  match "_", %{ last_call: true } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end

end
