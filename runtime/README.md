# Developers' memo for runtimes

All runtimes should include at least the following methods in
`KaitaiStream` class (or its equivalent). It's heavily preferred to
maintain exactly this order of declarations and group headers.

## Stream positioning

* `eof?`
* `seek(n)`
* `pos`
* `size`

## Integer numbers

### Signed

* `read_s1`

#### Big-endian

* `read_s2be`
* `read_s4be`
* `read_s8be`

#### Little-endian

* `read_s2le`
* `read_s4le`
* `read_s8le`

### Unsigned

* `read_u1`

#### Big-endian

* `read_u2be`
* `read_u4be`
* `read_u8be`

#### Little-endian

* `read_u2le`
* `read_u4le`
* `read_u8le`

## Floating point numbers

### Big-endian

* `read_f4be`
* `read_f8be`

### Little-endian

* `read_f4le`
* `read_f8le`

## Byte arrays

* `read_bytes(n)`
* `read_bytes_full`
* `ensure_fixed_contents`

## Strings

* `read_str_eos(String encoding)`
* `read_str_byte_limit(long len, String encoding)`
* `read_strz(String encoding, int term, boolean includeTerm, boolean consumeTerm, boolean eosError)`

## Byte array processing

* `process_xor(data, key)`
  * `process_xor_one(data, key)`
  * `process_xor_many(data, key)`
* `process_rotate_left(data, amount, group_size)`
* `process_zlib(data)`
