require "cript/version"

module Cript
  PRIVATE_KEY = "-----BEGIN RSA PRIVATE KEY-----\nMIIEoQIBAAKCAQEArhk4ZdrUm73R8gIZ0w6oJpLvjjgu3YvKC3rWF6Hg9nmC52Md\nWD+L10LEKttfKai11s9E+qP+UwEjqq+VVqaTfQpgK/uwAw5t7UuBvYUqBN9J7Zoq\nfFOONTl6y86eEJYj1hkM7+/PP8r5G3C/FYw2AyuduAArWZixuBrdOY8umsUvqPGR\nKFJsvxfR3VGuL2Lq0YuaZlwPpmIimxFnGgpCaRcFRlIPWfSm7AQgAe11bV/vXx+6\nKYNGYT+dQeXZZA38KDRha7ibJbX0q06izWz4j01Dzo/gKMwEzMegbCMq+XyAKPAj\nXZhr7HmrclUZyzo+iMP51G3mEriG1HA7NFac8QIDAQABAoIBAHYxUQR1B5mjyIAP\nxRBwBuAJKPDYW5i0ajpY7jelAmDSJXiI5Ucf/QPqo9qki3pwuuJWXHH8G5CmWVxr\nT2tAMyjUfm3dtKSeiypp9G6BlQExxbK00tsMrqKbny3124FPLI0Q/KN3nq+kUHG8\nnT03rwN//NcJ5mQxMZXXRxDoj68pyHcCU6cMjweC1vEWMIABGTJVTxHfobIVmfI6\n8gnxdMxmkgyJHdKKwzztaKdDNl5ISlhtisnuF/cIT0dWBkAdO+aIgePPK0rOgCL8\nW/YZ8cSLSag7WJnPQPhODhGNsRXhDeemtZUD+MGJ4i0D/B5zXm3yRJhqrbkpiNDg\nO91InbECgYEA157UYoymjPaZk/Tz/5PpGte46oPTAztD56XIxdm7XPwITmeQ/qhs\nXeaN3n8wt/wAjilvtGSUna7wtJCHM/Y8iP6SHSP3Fa/24xuH9MtapzTGLgrk4guh\neG05tsAWjTiKfYpbtgs6cTbwQFkgJaiMNuymeg4yxX3h+AVw9H+nYK8CgYEAzrPE\na2I/LwBuyM5OWD2ztlEm5GkjADXdU6eUJEuuQZGh7fldXz82Ld1vOiRUN8LPBhCQ\nfvikid9ZBb2DqzdvkL0dMHw5kx6lV+8gPRScaSkD+g58MpUTv0NGKQM7nxdPSvPk\n7X72QwmqcnJbIS+Al6HpPVYmeFzqP2RE0wt5BF8Cfyr0eVsoqgVrGy1enz1LOiUe\n1LfjiyYZqG19mYHQ3oKnsv/rofcZln0ecSTiMdJ1YabwmlBVuUWwlENkh4rSgzzH\nelRT1eV8KLMVyP/7gxPMb668fNyLdJ+JIvZFTjjUCsL3zU127y2exD4Ng1n9OfG3\nM3MdYP/3FA1VCCutQqsCgYAlx0FdBwXZR1D4LoyvIAfaiJZ9JKIbBb0/7t7qi1J7\n9WwNHIhuQhVa6J/Nlpo13ssLprdiHXulH0cb/3kzL9yaLZZKKEo1k2JQ4gmYYE3+\nAlsRttgIPqrvSBJoqIibGR2K62yp44yK0Bdw92mkdRQhopwIc9hwIztE/sR9dhlW\nLQKBgQCjD01i0JTA+mKQk9zPQzduDfTqMx5DVRqndROaKkqpgasMb5wBCSCWddlS\nJRWbl6Yiwv5AZMcYWw5zjd83w7zD/XiQYGxLF2oVbWXFl/65Qxj0Oum/TWM32+LH\n2oUSPzpyvmzM16o7vHW+1sPIaPGt/y63UzKXqf4kJrs6Wy5ipQ==\n-----END RSA PRIVATE KEY-----\n"
  PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArhk4ZdrUm73R8gIZ0w6o\nJpLvjjgu3YvKC3rWF6Hg9nmC52MdWD+L10LEKttfKai11s9E+qP+UwEjqq+VVqaT\nfQpgK/uwAw5t7UuBvYUqBN9J7ZoqfFOONTl6y86eEJYj1hkM7+/PP8r5G3C/FYw2\nAyuduAArWZixuBrdOY8umsUvqPGRKFJsvxfR3VGuL2Lq0YuaZlwPpmIimxFnGgpC\naRcFRlIPWfSm7AQgAe11bV/vXx+6KYNGYT+dQeXZZA38KDRha7ibJbX0q06izWz4\nj01Dzo/gKMwEzMegbCMq+XyAKPAjXZhr7HmrclUZyzo+iMP51G3mEriG1HA7NFac\n8QIDAQAB\n-----END PUBLIC KEY-----\n"
  KEY_SIZE = 2048
end

require "cript/cripter"
require "cript/simple"
require "cript/naive"
require "cript/store"
require "cript/ehash"
