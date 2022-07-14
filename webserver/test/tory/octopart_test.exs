defmodule Tory.OctopartTest do
  use ExUnit.Case, async: true
  import Tory.Octopart

  describe "api searching" do
    test "search_octopart with only mpn" do
      alias Tory.Part.Part, as: P
      part = %P{mpn: "1N904"}
      assert length(search_octopart(part)) == 1
      assert length(search_octopart(part, 1)) == 1
      assert length(search_octopart(part, 2)) == 2
    end

    test "search_octopart with octopart id" do
      alias Tory.Part.Part, as: P
      part = %P{mpn: "12345"}
      assert length(search_octopart(part)) == 1
    end
  end
end
