# SimpleCipher

usage:  
`module.Encrypt(plaintext, key)`  

`module.Decrypt(encrypted, key)`  

```lua
local encryptor = require(dir)

local encrypted = encryptor.Encrypt("test plaintext", "key")

print(encrypted) -- encrypted text

local decrypted = encryptor.Decrypt(encrypted, "key")

print(decrypted) -- "test plaintext"
```
