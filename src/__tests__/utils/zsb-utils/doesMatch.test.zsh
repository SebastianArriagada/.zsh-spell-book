describe "isInteger function"; () (
  local -A testData=(
    ['1']=0
    ['2']=0
    ['3']=0
    [10]=0
    [100]=0

    ['2.1']=''
    ['1.1']=''
    ['0.0']=''
  )

  for input expected in "${(@kv)testData}"; do
    it="should return '${expected}' for '${input}'"; () {
      local result="$(${zsb}.isInteger $input)"
      [[ "$result" -eq "$expected" ]]
      expect $?
    }
  done
)
