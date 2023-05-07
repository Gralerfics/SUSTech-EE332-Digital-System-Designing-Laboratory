use work.types.all;


package constants is
    constant STEPTABLE_WAVE: step_table_t := (
        "1000",
        "0100",
        "0010",
        "0001"
    );

    constant STEPTABLE_FULLSTEP: step_table_t := (
        "1001",
        "1100",
        "0110",
        "0011"
    );

    constant STEPTABLE_HALFSTEP: step_table_t := (
        "1001",
        "1000",
        "1100",
        "0100",
        "0110",
        "0010",
        "0011",
        "0001"
    );
end package;
