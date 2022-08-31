#required reading for context https://docs.microsoft.com/en-us/archive/blogs/openspecification/msds-supportedencryptiontypes-episode-1-computer-accounts
#required reading: https://techcommunity.microsoft.com/t5/core-infrastructure-and-security/decrypting-the-selection-of-supported-kerberos-encryption-types/ba-p/1628797
#type "28" is "RC4","AES128","AES256" - we want this
#DES must be removed

get-adcomputer -properties msDS-SupportedEncryptionTypes -filter *