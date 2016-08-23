defmodule Issues.Printer do

  @number_width 6
  @created_at_width 22
  @title_width 50

  def print_table(list_of_issues) do
    print_header
    for issue <- list_of_issues, do: print_issue(issue)
  end

  def print_header do
    IO.puts "#{pad_value(:num, "#")}|#{pad_value(:created, "created_at")}|#{pad_value(:title, "title")}"
    IO.puts "#{String.duplicate("-", @number_width)}+#{String.duplicate("-", @created_at_width)}+#{String.duplicate("-", @title_width)}"
  end

  def print_issue(issue) do
    IO.puts "#{pad_value(:num, "#{issue["number"]}")}|#{pad_value(:created, issue["created_at"])}|#{pad_value(:title, issue["title"])}"
  end

  def pad_value(:num, str), do: _pad_value(str, @number_width)
  def pad_value(:created, str), do: _pad_value(str, @created_at_width)
  def pad_value(:title, str), do: _pad_value(str, @title_width)

  defp _pad_value(str, col_width) do
    cond do
      String.length(str) >= col_width -> str
                                         |> String.pad_leading(String.length(str) + 1)
                                         |> String.slice(0, col_width)
      true -> str
              |> String.pad_leading(String.length(str) + 1)
              |> String.pad_trailing(col_width)
    end
  end
end

