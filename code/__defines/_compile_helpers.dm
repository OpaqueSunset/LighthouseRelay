#define BITSHIFT_LEFT(X, N) (X << (N))
#define BITSHIFT_RIGHT(X, N) (X >> (N))
#define BITFLAG(X) BITSHIFT_LEFT(1, X)

/// A null statement to guard against EmptyBlock lint without necessitating the use of pass()
/// Used to avoid proc-call overhead. But use sparingly. Probably pointless in most places.
#define EMPTY_BLOCK_GUARD ;