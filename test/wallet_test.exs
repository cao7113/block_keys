defmodule WalletTest do
  use ExUnit.Case, async: true

  # https://github.com/zyield/block_keys/wiki
  describe "block_keys" do
    test "ok" do
      mnemo =
        "wave album humble cinnamon security welcome bulk debate also flash physical fortune dwarf great prize okay brief peanut piano enrich sugar rifle account crumble"

      root_key = BlockKeys.from_mnemonic(mnemo)

      BlockKeys.CKD.derive(root_key, "M/44'/60'/0'/0/0")
      |> IO.inspect(label: "derive key")
    end
  end
end
