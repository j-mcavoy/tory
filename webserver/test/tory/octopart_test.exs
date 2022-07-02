defmodule Tory.OctopartTest do
  use Tory.DataCase

  describe "octopart" do
    alias Tory.Octopart
    alias Tory.Part.Part

    test "fetch_meta_from_octopart with only mpn works" do
      part = %Part{mpn: "some mpn"}
      resp = octopart_api_fetch(part)
    end
  end
end
