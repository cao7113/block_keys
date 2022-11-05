defmodule WalletTest do
  use ExUnit.Case, async: true

  # https://github.com/zyield/block_keys/wiki
  describe "block_keys" do
    test "ok" do
      mnemo =
        "wave album humble cinnamon security welcome bulk debate also flash physical fortune dwarf great prize okay brief peanut piano enrich sugar rifle account crumble"
        |> IO.inspect(label: "mnemo")

      root_key = BlockKeys.from_mnemonic(mnemo) |> IO.inspect(label: "root key")

      BlockKeys.CKD.derive(root_key, "m/44'/60'/0'")
      |> IO.inspect(label: "account priv key")

      BlockKeys.CKD.derive(root_key, "M/44'/60'/0'")
      |> IO.inspect(label: "account pub key")

      BlockKeys.CKD.derive(root_key, "m/44'/60'/0'/0")
      |> IO.inspect(label: "BIP32 Extended priv key")

      BlockKeys.CKD.derive(root_key, "M/44'/60'/0'/0")
      |> IO.inspect(label: "BIP32 Extended pub key")

      BlockKeys.CKD.derive(root_key, "m/44'/60'/0'/0/0")
      |> IO.inspect(label: "derive /0/0 priv key")

      path = "M/44'/60'/0'/0/0"

      xpub =
        BlockKeys.CKD.derive(root_key, path)
        |> IO.inspect(label: "derive /0/0 pub key")

      xpub
      |> BlockKeys.Ethereum.Address.from_xpub()
      |> IO.inspect(label: "eth address")

      xpub
      |> BlockKeys.Ethereum.Address.from_xpub()
      |> IO.inspect(label: "eth address again")

      BlockKeys.CKD.derive(root_key, "M/44'/60'/0'/0/1")
      |> BlockKeys.Ethereum.Address.from_xpub()
      |> IO.inspect(label: "eth /0/1 address")

      # "0x73bb50c828fd325c011d740fde78d02528826156"
    end
  end
end
