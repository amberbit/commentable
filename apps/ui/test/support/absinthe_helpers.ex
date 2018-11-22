defmodule Ui.AbsintheHelpers do
  def query(query, query_name, variables \\ %{}) do
    %{
      "operationName" => "#{query_name}",
      "query" => "#{query}",
      "variables" => Poison.encode!(variables)
    }
  end
end
