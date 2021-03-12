local simpleCipher = {}

simpleCipher.Encrypt = function(str, key)
    assert(type(str) == "string", "No string value given.")
    assert(type(key) == "string", "Invalid key.")
    
    local plaintext = {}
    local keytext = {}
    local result = ""
    
    for c in str:gmatch(".") do
        table.insert(plaintext, c)
    end
    
    for c in key:gmatch(".") do
        table.insert(keytext, c)
    end
    
    for i, v in ipairs(plaintext) do
        local k = keytext[i % #keytext == 0 and 3 or i % #keytext]
        result = result.."&"..bit32.bxor(v:byte(), k:byte())
    end
    
    return result
end

simpleCipher.Decrypt = function(str, key)
    assert(type(str) == "string", "No string value given.")
    assert(type(key) == "string", "Invalid key.")

    local text = {}
    local keytext = {}
    local result = ""

    for c in str:gmatch("&%d+") do
        table.insert(text, tonumber(c:sub(2, #c)))
    end

    for c in key:gmatch(".") do
        table.insert(keytext, c)
    end
    
    for i, v in ipairs(text) do
        local k = keytext[i % #keytext == 0 and 3 or i % #keytext]
        result = result..string.char(bit32.bxor(v, k:byte()))
    end
    
    return result
end

return simpleCipher
