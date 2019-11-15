defmodule Talos.Types.ArrayTypeTest do
  use ExUnit.Case
  alias Talos.Types.ArrayType
  alias Talos.Types.NumberType

  test "#valid?" do
    assert true == ArrayType.valid?(%ArrayType{}, [])
    assert true == ArrayType.valid?(%ArrayType{}, [1])
    assert true == ArrayType.valid?(%ArrayType{}, [1, 2])
    assert false == ArrayType.valid?(%ArrayType{}, nil)
    assert false == ArrayType.valid?(%ArrayType{}, 1)
    assert false == ArrayType.valid?(%ArrayType{}, "string")
  end

  test "#valid? - with additional params" do
    number_type = %NumberType{gteq: 0}

    assert true == ArrayType.valid?(%ArrayType{type: number_type}, [])
    assert true == ArrayType.valid?(%ArrayType{type: number_type}, [1])
    assert true == ArrayType.valid?(%ArrayType{type: number_type}, [0, 1, 2])

    assert false == ArrayType.valid?(%ArrayType{type: number_type}, [-1000, 1, 2])
    assert false == ArrayType.valid?(%ArrayType{type: number_type}, ["string"])
  end
end
