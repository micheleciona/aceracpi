/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080514
 *
 * Disassembly of 1510, Mon Oct 27 19:34:48 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005B0D (23309)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0x86
 *     OEM ID           "NVIDIA"
 *     OEM Table ID     "CK8"
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000E (16777230)
 */
DefinitionBlock ("1510.aml", "DSDT", 1, "NVIDIA", "CK8", 0x06040000)
{
    External (Z005)
    External (\_PR_.CPU0._PPC)

    OperationRegion (P80G, SystemIO, 0x80, 0x01)
    Field (P80G, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
    }

    Name (SX, 0x00)
    Name (INSX, 0x00)
    Name (\_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x04)
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)
    {
        0x06, 
        0x06, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)
    {
        0x07, 
        0x07, 
        0x00, 
        0x00
    })
    Method (VTOB, 1, NotSerialized)
    {
        Store (0x01, Local0)
        ShiftLeft (Local0, Arg0, Local0)
        Return (Local0)
    }

    Method (BTOV, 1, NotSerialized)
    {
        ShiftRight (Arg0, 0x01, Local0)
        Store (0x00, Local1)
        While (Local0)
        {
            Increment (Local1)
            ShiftRight (Local0, 0x01, Local0)
        }

        Return (Local1)
    }

    Method (MKWD, 2, NotSerialized)
    {
        If (And (Arg1, 0x80))
        {
            Store (0xFFFF0000, Local0)
        }
        Else
        {
            Store (Zero, Local0)
        }

        Or (Local0, Arg0, Local0)
        Or (Local0, ShiftLeft (Arg1, 0x08), Local0)
        Return (Local0)
    }

    Method (POSW, 1, NotSerialized)
    {
        If (And (Arg0, 0x8000))
        {
            If (LEqual (Arg0, 0xFFFF))
            {
                Return (0xFFFFFFFF)
            }
            Else
            {
                Not (Arg0, Local0)
                Increment (Local0)
                And (Local0, 0xFFFF, Local0)
                Return (Local0)
            }
        }
        Else
        {
            Return (Arg0)
        }
    }

    Method (GBFE, 3, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TIDX)
        Store (TIDX, Arg2)
    }

    Method (PBFE, 3, NotSerialized)
    {
        CreateByteField (Arg0, Arg1, TIDX)
        Store (Arg2, TIDX)
    }

    Method (ITOS, 1, NotSerialized)
    {
        Store (Buffer (0x09)
            {
                /* 0000 */    0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00
            }, Local0)
        Store (Buffer (0x11)
            {
                "0123456789ABCDEF"
            }, Local7)
        Store (0x08, Local1)
        Store (0x00, Local2)
        Store (0x00, Local3)
        While (Local1)
        {
            Decrement (Local1)
            And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
            If (Local4)
            {
                Store (Ones, Local3)
            }

            If (Local3)
            {
                GBFE (Local7, Local4, RefOf (Local5))
                PBFE (Local0, Local2, Local5)
                Increment (Local2)
            }
        }

        Return (Local0)
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
    }

    Scope (\_SB)
    {
        Name (ECOK, 0x00)
        Name (TOFF, 0x00)
        Device (MEM0)
        {
            Name (_HID, EisaId ("PNP0C01"))
            Method (_CRS, 0, Serialized)
            {
                Name (MEMR, ResourceTemplate ()
                {
                    Memory32Fixed (ReadOnly,
                        0xFFC00000,         // Address Base
                        0x00400000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y00)
                })
                CreateDWordField (MEMR, \_SB.MEM0._CRS._Y00._BAS, MBAS)
                CreateDWordField (MEMR, \_SB.MEM0._CRS._Y00._LEN, MBLE)
                If (\_SB.PCI0.LPC0.MTBA)
                {
                    Store (\_SB.PCI0.LPC0.MTBA, MBAS)
                    Store (0x1000, MBLE)
                }

                Return (MEMR)
            }
        }

        Device (PCI0)
        {
            Name (_PRW, Package (0x02)
            {
                0x00, 
                0x04
            })
            Name (_PRT, Package (0x07)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PCI0.LSMB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    \_SB.PCI0.LSMB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    \_SB.PCI0.LUS0, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x01, 
                    \_SB.PCI0.LUS1, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    \_SB.PCI0.LUS2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    \_SB.PCI0.LACI, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x01, 
                    \_SB.PCI0.LMCI, 
                    0x00
                }
            })
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_BBN, 0x00)
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Method (_INI, 0, NotSerialized)
            {
            }

            Scope (\_SB)
            {
                OperationRegion (ASLD, SystemMemory, 0x7FF7FD2C, 0x00000100)
                Field (ASLD, AnyAcc, NoLock, Preserve)
                {
                    TOM,    32
                }
            }

            Name (CBUF, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00100000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFFF00000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C0FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C1000,         // Range Minimum
                    0x000C1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C2000,         // Range Minimum
                    0x000C2FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C3000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C4FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C5000,         // Range Minimum
                    0x000C5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C6000,         // Range Minimum
                    0x000C6FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C7000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000C8FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C9000,         // Range Minimum
                    0x000C9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CA000,         // Range Minimum
                    0x000CAFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CB000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CCFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CD000,         // Range Minimum
                    0x000CDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CE000,         // Range Minimum
                    0x000CEFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y10, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CF000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y11, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D0FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y12, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D1000,         // Range Minimum
                    0x000D1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y13, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D2000,         // Range Minimum
                    0x000D2FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y14, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D3000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y15, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D4FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y16, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D5000,         // Range Minimum
                    0x000D5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y17, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D6000,         // Range Minimum
                    0x000D6FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y18, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D7000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y19, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000D8FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y1A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D9000,         // Range Minimum
                    0x000D9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y1B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DA000,         // Range Minimum
                    0x000DAFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y1C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DB000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y1D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DCFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y1E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DD000,         // Range Minimum
                    0x000DDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y1F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DE000,         // Range Minimum
                    0x000DEFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y20, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DF000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00001000,         // Length
                    0x00,, _Y21, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (CBUF, \_SB.PCI0._Y01._MIN, PMMN)
                CreateDWordField (CBUF, \_SB.PCI0._Y01._LEN, PMLN)
                Multiply (\_SB.TOM, 0x00100000, PMMN)
                Subtract (0xFEC00000, PMMN, PMLN)
                CreateBitField (CBUF, \_SB.PCI0._Y02._RW, C0RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y02._LEN, C0LN)
                Store (One, C0RW)
                Store (0x1000, C0LN)
                If (\_SB.PCI0.LPC0.SHC0)
                {
                    Store (0x00, C0LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y03._RW, C1RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y03._LEN, C1LN)
                Store (One, C1RW)
                Store (0x1000, C1LN)
                If (\_SB.PCI0.LPC0.SHC1)
                {
                    Store (0x00, C1LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y04._RW, C2RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y04._LEN, C2LN)
                Store (One, C2RW)
                Store (0x1000, C2LN)
                If (\_SB.PCI0.LPC0.SHC2)
                {
                    Store (0x00, C2LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y05._RW, C3RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y05._LEN, C3LN)
                Store (One, C3RW)
                Store (0x1000, C3LN)
                If (\_SB.PCI0.LPC0.SHC3)
                {
                    Store (0x00, C3LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y06._RW, C4RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y06._LEN, C4LN)
                Store (One, C4RW)
                Store (0x1000, C4LN)
                If (\_SB.PCI0.LPC0.SHC4)
                {
                    Store (0x00, C4LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y07._RW, C5RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y07._LEN, C5LN)
                Store (One, C5RW)
                Store (0x1000, C5LN)
                If (\_SB.PCI0.LPC0.SHC5)
                {
                    Store (0x00, C5LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y08._RW, C6RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y08._LEN, C6LN)
                Store (One, C6RW)
                Store (0x1000, C6LN)
                If (\_SB.PCI0.LPC0.SHC6)
                {
                    Store (0x00, C6LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y09._RW, C7RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y09._LEN, C7LN)
                Store (One, C7RW)
                Store (0x1000, C7LN)
                If (\_SB.PCI0.LPC0.SHC7)
                {
                    Store (0x00, C7LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y0A._RW, C8RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y0A._LEN, C8LN)
                Store (One, C8RW)
                Store (0x1000, C8LN)
                If (\_SB.PCI0.LPC0.SHC8)
                {
                    Store (0x00, C8LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y0B._RW, C9RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y0B._LEN, C9LN)
                Store (One, C9RW)
                Store (0x1000, C9LN)
                If (\_SB.PCI0.LPC0.SHC9)
                {
                    Store (0x00, C9LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y0C._RW, CARW)
                CreateDWordField (CBUF, \_SB.PCI0._Y0C._LEN, CALN)
                Store (One, CARW)
                Store (0x1000, CALN)
                If (\_SB.PCI0.LPC0.SHCA)
                {
                    Store (0x00, CALN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y0D._RW, CBRW)
                CreateDWordField (CBUF, \_SB.PCI0._Y0D._LEN, CBLN)
                Store (One, CBRW)
                Store (0x1000, CBLN)
                If (\_SB.PCI0.LPC0.SHCB)
                {
                    Store (0x00, CBLN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y0E._RW, CCRW)
                CreateDWordField (CBUF, \_SB.PCI0._Y0E._LEN, CCLN)
                Store (One, CCRW)
                Store (0x1000, CCLN)
                If (\_SB.PCI0.LPC0.SHCC)
                {
                    Store (0x00, CCLN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y0F._RW, CDRW)
                CreateDWordField (CBUF, \_SB.PCI0._Y0F._LEN, CDLN)
                Store (One, CDRW)
                Store (0x1000, CDLN)
                If (\_SB.PCI0.LPC0.SHCD)
                {
                    Store (0x00, CDLN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y10._RW, CERW)
                CreateDWordField (CBUF, \_SB.PCI0._Y10._LEN, CELN)
                Store (One, CERW)
                Store (0x1000, CELN)
                If (\_SB.PCI0.LPC0.SHCE)
                {
                    Store (0x00, CELN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y11._RW, CFRW)
                CreateDWordField (CBUF, \_SB.PCI0._Y11._LEN, CFLN)
                Store (One, CFRW)
                Store (0x1000, CFLN)
                If (\_SB.PCI0.LPC0.SHCF)
                {
                    Store (0x00, CFLN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y12._RW, D0RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y12._LEN, D0LN)
                Store (One, D0RW)
                Store (0x1000, D0LN)
                If (\_SB.PCI0.LPC0.SHD0)
                {
                    Store (0x00, D0LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y13._RW, D1RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y13._LEN, D1LN)
                Store (One, D1RW)
                Store (0x1000, D1LN)
                If (\_SB.PCI0.LPC0.SHD1)
                {
                    Store (0x00, D1LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y14._RW, D2RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y14._LEN, D2LN)
                Store (One, D2RW)
                Store (0x1000, D2LN)
                If (\_SB.PCI0.LPC0.SHD2)
                {
                    Store (0x00, D2LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y15._RW, D3RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y15._LEN, D3LN)
                Store (One, D3RW)
                Store (0x1000, D3LN)
                If (\_SB.PCI0.LPC0.SHD3)
                {
                    Store (0x00, D3LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y16._RW, D4RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y16._LEN, D4LN)
                Store (One, D4RW)
                Store (0x1000, D4LN)
                If (\_SB.PCI0.LPC0.SHD4)
                {
                    Store (0x00, D4LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y17._RW, D5RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y17._LEN, D5LN)
                Store (One, D5RW)
                Store (0x1000, D5LN)
                If (\_SB.PCI0.LPC0.SHD5)
                {
                    Store (0x00, D5LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y18._RW, D6RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y18._LEN, D6LN)
                Store (One, D6RW)
                Store (0x1000, D6LN)
                If (\_SB.PCI0.LPC0.SHD6)
                {
                    Store (0x00, D6LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y19._RW, D7RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y19._LEN, D7LN)
                Store (One, D7RW)
                Store (0x1000, D7LN)
                If (\_SB.PCI0.LPC0.SHD7)
                {
                    Store (0x00, D7LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y1A._RW, D8RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y1A._LEN, D8LN)
                Store (One, D8RW)
                Store (0x1000, D8LN)
                If (\_SB.PCI0.LPC0.SHD8)
                {
                    Store (0x00, D8LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y1B._RW, D9RW)
                CreateDWordField (CBUF, \_SB.PCI0._Y1B._LEN, D9LN)
                Store (One, D9RW)
                Store (0x1000, D9LN)
                If (\_SB.PCI0.LPC0.SHD9)
                {
                    Store (0x00, D9LN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y1C._RW, DARW)
                CreateDWordField (CBUF, \_SB.PCI0._Y1C._LEN, DALN)
                Store (One, DARW)
                Store (0x1000, DALN)
                If (\_SB.PCI0.LPC0.SHDA)
                {
                    Store (0x00, DALN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y1D._RW, DBRW)
                CreateDWordField (CBUF, \_SB.PCI0._Y1D._LEN, DBLN)
                Store (One, DBRW)
                Store (0x1000, DBLN)
                If (\_SB.PCI0.LPC0.SHDB)
                {
                    Store (0x00, DBLN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y1E._RW, DCRW)
                CreateDWordField (CBUF, \_SB.PCI0._Y1E._LEN, DCLN)
                Store (One, DCRW)
                Store (0x1000, DCLN)
                If (\_SB.PCI0.LPC0.SHDC)
                {
                    Store (0x00, DCLN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y1F._RW, DDRW)
                CreateDWordField (CBUF, \_SB.PCI0._Y1F._LEN, DDLN)
                Store (One, DDRW)
                Store (0x1000, DDLN)
                If (\_SB.PCI0.LPC0.SHDD)
                {
                    Store (0x00, DDLN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y20._RW, DERW)
                CreateDWordField (CBUF, \_SB.PCI0._Y20._LEN, DELN)
                Store (One, DERW)
                Store (0x1000, DELN)
                If (\_SB.PCI0.LPC0.SHDE)
                {
                    Store (0x00, DELN)
                }

                CreateBitField (CBUF, \_SB.PCI0._Y21._RW, DFRW)
                CreateDWordField (CBUF, \_SB.PCI0._Y21._LEN, DFLN)
                Store (One, DFRW)
                Store (0x1000, DFLN)
                If (\_SB.PCI0.LPC0.SHDF)
                {
                    Store (0x00, DFLN)
                }

                Return (CBUF)
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00010000)
                OperationRegion (P60, PCI_Config, 0x60, 0x02)
                Field (P60, AnyAcc, NoLock, Preserve)
                {
                    PMBR,   16
                }

                OperationRegion (P64, PCI_Config, 0x64, 0x02)
                Field (P64, AnyAcc, NoLock, Preserve)
                {
                    NVSB,   16
                }

                OperationRegion (P68, PCI_Config, 0x68, 0x02)
                Field (P68, AnyAcc, NoLock, Preserve)
                {
                    ANLG,   16
                }

                OperationRegion (P44, PCI_Config, 0x44, 0x04)
                Field (P44, AnyAcc, NoLock, Preserve)
                {
                    MTBA,   32
                }

                OperationRegion (GPIO, SystemIO, 0x8400, 0xF0)
                Field (GPIO, WordAcc, NoLock, Preserve)
                {
                            Offset (0xCF), 
                        ,   5, 
                    LIDS,   1
                }

                Device (PMIO)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x03)
                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (IODM, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                        })
                        Name (IORT, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y22)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y23)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y24)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y25)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y26)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y27)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x40,               // Length
                                _Y28)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x40,               // Length
                                _Y29)
                        })
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y22._MIN, I1MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y22._MAX, I1MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y23._MIN, I2MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y23._MAX, I2MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y24._MIN, I3MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y24._MAX, I3MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y25._MIN, I4MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y25._MAX, I4MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y26._MIN, I5MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y26._MAX, I5MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y27._MIN, I6MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y27._MAX, I6MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y28._MIN, I7MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y28._MAX, I7MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y29._MIN, I8MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y29._MAX, I8MX)
                        And (PMBR, 0xFFFC, I1MN)
                        Store (I1MN, I1MX)
                        Add (I1MN, 0x80, Local0)
                        Store (Local0, I2MN)
                        Store (Local0, I2MX)
                        And (NVSB, 0xFFFC, I3MN)
                        Store (I3MN, I3MX)
                        Add (I3MN, 0x80, Local0)
                        Store (Local0, I4MN)
                        Store (Local0, I4MX)
                        And (ANLG, 0xFFFC, I5MN)
                        Store (I5MN, I5MX)
                        Add (I5MN, 0x80, Local0)
                        Store (Local0, I6MN)
                        Store (Local0, I6MX)
                        And (\_SB.PCI0.SMB0.SB50, 0xFFFC, I7MN)
                        Store (I7MN, I7MX)
                        And (\_SB.PCI0.SMB0.SB54, 0xFFFC, I8MN)
                        Store (I8MN, I8MX)
                        If (I1MN)
                        {
                            Store (IORT, Local0)
                        }
                        Else
                        {
                            Store (IODM, Local0)
                        }

                        Return (Local0)
                    }
                }

                Device (SYS0)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x01)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x01,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0074,             // Range Minimum
                            0x0074,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x0091,             // Range Minimum
                            0x0091,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0097,             // Range Minimum
                            0x0097,             // Range Maximum
                            0x01,               // Alignment
                            0x09,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x01,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                }

                Device (PIC0)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x04,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x04,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {2}
                    })
                }

                Device (PIT0)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {0}
                    })
                }

                Device (DMA0)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x09,               // Length
                            )
                        IO (Decode16,
                            0x000A,             // Range Minimum
                            0x000A,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x12,               // Length
                            )
                        IO (Decode16,
                            0x00D4,             // Range Minimum
                            0x00D4,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                    })
                }

                Device (SPK0)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {8}
                    })
                }

                Device (MTH0)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {13}
                    })
                }

                Device (KBC)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_UID, 0x01)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Name (_UID, 0x00)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    OperationRegion (SIIO, SystemIO, 0x4E, 0x02)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (N393, 0x00)
                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x26), 
                        FDCE,   1, 
                        LPTE,   1, 
                        Z000,   1, 
                        Z001,   1, 
                                Offset (0x30), 
                        ACTR,   1, 
                                Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                                Offset (0x70), 
                        INTR,   8, 
                                Offset (0x74), 
                        DMCH,   8, 
                        DMCL,   8, 
                                Offset (0xF0), 
                        OPT1,   8
                    }

                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (N393, 0xFFFF)
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Release (N393)
                    }

                    Device (FDC)
                    {
                        Name (_HID, EisaId ("PNP0700"))
                        Name (_UID, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x00)
                            If (LEqual (FDCE, 0x00))
                            {
                                If (ACTR)
                                {
                                    Store (0x0F, Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            EXFG ()
                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x00)
                            Store (0x00, ACTR)
                            Store (0x00, INTR)
                            Store (0x00, IOAH)
                            Store (0x00, IOAL)
                            Store (0x00, DMCH)
                            EXFG ()
                        }

                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                _Y2A)
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                _Y2B)
                            IRQNoFlags (_Y2C)
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, _Y2D)
                                {2}
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            CreateWordField (RSRC, \_SB.PCI0.LPC0.SIO.FDC._Y2A._MIN, IO1L)
                            CreateWordField (RSRC, \_SB.PCI0.LPC0.SIO.FDC._Y2A._MAX, IO1H)
                            CreateWordField (RSRC, \_SB.PCI0.LPC0.SIO.FDC._Y2B._MIN, IO2L)
                            CreateWordField (RSRC, \_SB.PCI0.LPC0.SIO.FDC._Y2B._MAX, IO2H)
                            CreateWordField (RSRC, \_SB.PCI0.LPC0.SIO.FDC._Y2C._INT, IRQX)
                            CreateByteField (RSRC, \_SB.PCI0.LPC0.SIO.FDC._Y2D._DMA, DMAX)
                            Store (Zero, IO1L)
                            Store (Zero, IO1H)
                            Store (Zero, IO2L)
                            Store (Zero, IO2H)
                            Store (Zero, IRQX)
                            Store (Zero, DMAX)
                            ENFG (0x00)
                            Store (ACTR, Local0)
                            EXFG ()
                            If (Local0)
                            {
                                Store (_PRS, RSRC)
                            }

                            Return (RSRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x01,               // Alignment
                                0x06,               // Length
                                )
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x01,               // Alignment
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {6}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {2}
                        })
                        Method (_SRS, 1, NotSerialized)
                        {
                            Store (Arg0, RSRC)
                            CreateWordField (RSRC, \_SB.PCI0.LPC0.SIO.FDC._Y2A._MIN, IOX)
                            CreateWordField (RSRC, \_SB.PCI0.LPC0.SIO.FDC._Y2C._INT, IRQX)
                            CreateByteField (RSRC, \_SB.PCI0.LPC0.SIO.FDC._Y2D._DMA, DMAX)
                            ENFG (0x00)
                            And (IOX, 0xFF, IOAL)
                            ShiftRight (IOX, 0x08, IOAH)
                            FindSetRightBit (IRQX, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, INTR)
                            FindSetRightBit (DMAX, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, DMCH)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("NSC6001"))
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x02)
                            If (LEqual (Z000, 0x00))
                            {
                                If (ACTR)
                                {
                                    Store (0x0F, Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            EXFG ()
                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x02)
                            Store (0x00, ACTR)
                            Store (0x00, INTR)
                            Store (0x00, IOAH)
                            Store (0x00, IOAL)
                            Store (0x00, DMCH)
                            Store (0x00, DMCL)
                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {0}
                            })
                            ENFG (0x02)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x09))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0A))
                                ShiftLeft (0x01, DMCH, Local0)
                                Store (Local0, Index (DCRS, 0x0C))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0D))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x09))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x0D))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            CreateWordField (Arg0, 0x0C, DMAM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            FindSetRightBit (DMAM, Local1)
                            Decrement (Local1)
                            ENFG (0x02)
                            Store (Local0, INTR)
                            Store (Local1, DMCH)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            Or (0x80, OPT1, OPT1)
                            EXFG ()
                        }
                    }

                    Device (COMA)
                    {
                        Name (_HID, EisaId ("PNP0501"))
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x03)
                            If (LEqual (Z001, 0x00))
                            {
                                If (ACTR)
                                {
                                    Store (0x0F, Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }

                            EXFG ()
                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x03)
                            Store (0x00, ACTR)
                            Store (0x00, INTR)
                            Store (0x00, IOAH)
                            Store (0x00, IOAL)
                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            })
                            ENFG (0x03)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x09))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x0A))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x09))
                                Store (0x00, Index (DCRS, 0x0A))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x09, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x03)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (ECP)
                    {
                        Name (_HID, EisaId ("PNP0401"))
                        Name (_UID, 0x03)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x04), LEqual (
                                Local0, 0x07))))
                            {
                                ShiftLeft (ACTR, 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            EXFG ()
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x04), LEqual (
                                Local0, 0x07))))
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                                Store (0x00, DMCH)
                                Store (0x00, DMCL)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {3}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                                ShiftLeft (0x01, DMCH, Local0)
                                Store (Local0, Index (DCRS, 0x14))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x15))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                                Store (0x00, Index (DCRS, 0x14))
                                Store (0x00, Index (DCRS, 0x15))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            CreateWordField (Arg0, 0x14, DMAM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            FindSetRightBit (DMAM, Local1)
                            Decrement (Local1)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (Local1, DMCH)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (EPP)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x02)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x02), LEqual (
                                Local0, 0x03))))
                            {
                                ShiftLeft (ACTR, 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            EXFG ()
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LOr (LEqual (Local0, 0x02), LEqual (
                                Local0, 0x03))))
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (LPTB)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x01)))
                            {
                                ShiftLeft (ACTR, 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            EXFG ()
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x01)))
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                If (And (Local0, 0x04))
                                {
                                    Store (0x04, Local0)
                                }
                                Else
                                {
                                    Store (0x08, Local0)
                                }

                                Store (Local0, Index (DCRS, 0x06))
                                Store (Local0, Index (DCRS, 0x07))
                                Store (Local0, Index (DCRS, 0x0E))
                                Store (Local0, Index (DCRS, 0x0F))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }

                    Device (LPT)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x00)
                        Method (_STA, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x00)))
                            {
                                ShiftLeft (ACTR, 0x01, Local1)
                                Add (0x0D, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            EXFG ()
                            Return (Local1)
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            ENFG (0x01)
                            Store (OPT1, Local0)
                            ShiftRight (Local0, 0x05, Local0)
                            If (LAnd (LEqual (LPTE, 0x00), LEqual (Local0, 0x00)))
                            {
                                Store (0x00, ACTR)
                                Store (0x00, INTR)
                                Store (0x00, IOAH)
                                Store (0x00, IOAL)
                            }

                            EXFG ()
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x04,               // Alignment
                                    0x04,               // Length
                                    )
                                IRQNoFlags ()
                                    {5}
                            }
                            EndDependentFn ()
                        })
                        Method (_CRS, 0, NotSerialized)
                        {
                            Name (DCRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0000,             // Range Minimum
                                    0x0000,             // Range Maximum
                                    0x08,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {7}
                            })
                            ENFG (0x01)
                            If (ACTR)
                            {
                                Store (IOAH, Local1)
                                Store (IOAL, Local0)
                                Store (Local0, Index (DCRS, 0x02))
                                Store (Local0, Index (DCRS, 0x0A))
                                Store (Local0, Index (DCRS, 0x04))
                                Store (Local0, Index (DCRS, 0x0C))
                                Store (Local1, Index (DCRS, 0x03))
                                Store (Local1, Index (DCRS, 0x05))
                                Add (Local1, 0x04, Local1)
                                Store (Local1, Index (DCRS, 0x0B))
                                Store (Local1, Index (DCRS, 0x0D))
                                If (And (Local0, 0x04))
                                {
                                    Store (0x04, Local0)
                                }
                                Else
                                {
                                    Store (0x08, Local0)
                                }

                                Store (Local0, Index (DCRS, 0x06))
                                Store (Local0, Index (DCRS, 0x07))
                                Store (Local0, Index (DCRS, 0x0E))
                                Store (Local0, Index (DCRS, 0x0F))
                                ShiftLeft (0x01, INTR, Local0)
                                Store (Local0, Index (DCRS, 0x11))
                                ShiftRight (Local0, 0x08, Local1)
                                Store (Local1, Index (DCRS, 0x12))
                            }
                            Else
                            {
                                Store (0x00, Index (DCRS, 0x02))
                                Store (0x00, Index (DCRS, 0x0A))
                                Store (0x00, Index (DCRS, 0x04))
                                Store (0x00, Index (DCRS, 0x0C))
                                Store (0x00, Index (DCRS, 0x03))
                                Store (0x00, Index (DCRS, 0x05))
                                Store (0x00, Index (DCRS, 0x0B))
                                Store (0x00, Index (DCRS, 0x0D))
                                Store (0x00, Index (DCRS, 0x11))
                                Store (0x00, Index (DCRS, 0x12))
                            }

                            EXFG ()
                            Return (DCRS)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, ADRL)
                            CreateByteField (Arg0, 0x03, ADRM)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x01)
                            Store (Local0, INTR)
                            Store (ADRM, IOAH)
                            Store (ADRL, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }
                }

                OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x7FF7FE2D, 0x00000120)
                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    BCMD,   8, 
                    DID,    32, 
                    INF,    8
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x110), 
                    SHC0,   1, 
                    SHC1,   1, 
                    SHC2,   1, 
                    SHC3,   1, 
                    SHC4,   1, 
                    SHC5,   1, 
                    SHC6,   1, 
                    SHC7,   1, 
                    SHC8,   1, 
                    SHC9,   1, 
                    SHCA,   1, 
                    SHCB,   1, 
                    SHCC,   1, 
                    SHCD,   1, 
                    SHCE,   1, 
                    SHCF,   1, 
                    SHD0,   1, 
                    SHD1,   1, 
                    SHD2,   1, 
                    SHD3,   1, 
                    SHD4,   1, 
                    SHD5,   1, 
                    SHD6,   1, 
                    SHD7,   1, 
                    SHD8,   1, 
                    SHD9,   1, 
                    SHDA,   1, 
                    SHDB,   1, 
                    SHDC,   1, 
                    SHDD,   1, 
                    SHDE,   1, 
                    SHDF,   1, 
                            Offset (0x115), 
                    BTEN,   1, 
                    WLAN,   1
                }

                Mutex (PSMX, 0x00)
                Method (PHSR, 2, NotSerialized)
                {
                    Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                    Store (0x90, BCMD)
                    Store (Arg0, DID)
                    Store (Arg1, INF)
                    Store (Zero, SMIC)
                    Store (INF, Local0)
                    Release (\_SB.PCI0.LPC0.PSMX)
                    Return (Local0)
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Name (_GPE, 0x25)
                    Name (SEL0, 0xF0)
                    Name (BFLG, 0x00)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Local0)
                            If (Local0)
                            {
                                Store (0x01, ECOK)
                            }
                            Else
                            {
                                Store (0x00, ECOK)
                            }
                        }

                        If (\_SB.ECOK)
                        {
                            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                            Store (0x03, \_SB.PCI0.LPC0.EC0.RG59)
                            Store (\_SB.PCI0.LPC0.BTEN, \_SB.PCI0.LPC0.EC0.BLTH)
                            Store (\_SB.PCI0.LPC0.WLAN, \_SB.PCI0.LPC0.EC0.WLAN)
                            Store (0x01, \_SB.PCI0.LPC0.EC0.CPLE)
                            Release (\_SB.PCI0.LPC0.EC0.MUT1)
                        }
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        If (\_SB.ECOK)
                        {
                            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                            If (And (SMST, 0x40))
                            {
                                Store (SMAA, Local0)
                                If (LEqual (Local0, 0x14))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (PWRE, Local1)
                                    If (Local1)
                                    {
                                        Store (0x00, PWRE)
                                        Store (0x12, BFLG)
                                        CPOL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x16))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (0x04, \_SB.BAT1.BCRI)
                                    Notify (\_SB.BAT1, 0x80)
                                }
                                Else
                                {
                                    Store (0x00, \_SB.BAT1.BCRI)
                                }
                            }

                            Release (\_SB.PCI0.LPC0.EC0.MUT1)
                        }
                    }

                    Method (_Q09, 0, NotSerialized)
                    {
                        If (\_SB.ECOK)
                        {
                            Store (0x00, \_SB.PCI0.LPC0.EC0.PSTA)
                            \_SB.BAT1.Z002 ()
                            Notify (\_SB.ACAD, 0x80)
                            Sleep (0x01F4)
                            Notify (\_SB.BAT1, 0x80)
                            If (\_SB.BAT1.BTCH)
                            {
                                \_SB.BAT1.UBIF ()
                                Notify (\_SB.BAT1, 0x81)
                                Store (0x00, \_SB.BAT1.BTCH)
                            }
                        }
                    }

                    Name (CPUT, 0x00)
                    Method (_Q80, 0, NotSerialized)
                    {
                        If (\_SB.ECOK)
                        {
                            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                            Store (\_SB.PCI0.LPC0.EC0.CTMP, Local0)
                            Release (\_SB.PCI0.LPC0.EC0.MUT1)
                        }
                        Else
                        {
                            Store (0x28, Local0)
                        }

                        Subtract (Local0, \_SB.TOFF, Local0)
                        If (LGreaterEqual (Local0, 0x61))
                        {
                            Notify (\_TZ.THRM, 0x80)
                        }

                        If (LAnd (LGreaterEqual (Local0, 0x5C), LEqual (CPUT, 0x00)))
                        {
                            Store (0x01, CPUT)
                            Store (PNUM, Local1)
                            If (LLess (\_PR.CPU0._PPC, Local1))
                            {
                                Store (Local1, \_PR.CPU0._PPC)
                                Notify (\_PR.CPU0, 0x80)
                                Sleep (0x01F4)
                            }
                        }
                        Else
                        {
                            If (LAnd (LLessEqual (Local0, 0x57), LNotEqual (CPUT, 0x00)))
                            {
                                Store (0x00, CPUT)
                                Store (0x00, Local1)
                                If (LEqual (Local1, 0x00))
                                {
                                    If (LNotEqual (\_PR.CPU0._PPC, 0x00))
                                    {
                                        Store (0x00, \_PR.CPU0._PPC)
                                        Notify (\_PR.CPU0, 0x80)
                                        Sleep (0x01F4)
                                    }
                                }
                            }
                        }
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        \_SB.PCI0.LPC0.EC0._Q80 ()
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                        \_SB.PCI0.AGP0.VGA.DRUL (0x01)
                    }

                    Method (_Q0F, 0, NotSerialized)
                    {
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x04), 
                        CMCM,   8, 
                        CMD1,   8, 
                        CMD2,   8, 
                        CMD3,   8, 
                                Offset (0x18), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   256, 
                        BCNT,   8, 
                        SMAA,   8, 
                        BATD,   16, 
                        ACDF,   1, 
                                Offset (0x41), 
                            ,   4, 
                        FPR1,   1, 
                        FLS4,   1, 
                            ,   1, 
                        PFLG,   1, 
                                Offset (0x43), 
                        TMSS,   2, 
                            ,   2, 
                        BANK,   4, 
                                Offset (0x45), 
                        VFAN,   1, 
                                Offset (0x46), 
                        RL01,   1, 
                        RD01,   1, 
                        RF01,   1, 
                        RP01,   1, 
                        RB01,   1, 
                        RC01,   1, 
                            ,   1, 
                        R701,   1, 
                        R801,   1, 
                        RM01,   1, 
                        RI01,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        RA01,   1, 
                        RR01,   1, 
                        RL10,   1, 
                        RD10,   1, 
                        RF10,   1, 
                        RP10,   1, 
                        RB10,   1, 
                        RC10,   1, 
                            ,   1, 
                        R710,   1, 
                        R810,   1, 
                        RM10,   1, 
                        RI10,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        RA10,   1, 
                        RR10,   1, 
                        WL01,   1, 
                        WD01,   1, 
                        WF01,   1, 
                        WP01,   1, 
                        WB01,   1, 
                        WC01,   1, 
                            ,   1, 
                        W701,   1, 
                        W801,   1, 
                        WM01,   1, 
                        WI01,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        WA01,   1, 
                        WR01,   1, 
                        WL10,   1, 
                        WD10,   1, 
                        WF10,   1, 
                        WP10,   1, 
                        WB10,   1, 
                        WC10,   1, 
                            ,   1, 
                        W710,   1, 
                        W810,   1, 
                        WM10,   1, 
                        WI10,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        WA10,   1, 
                        WR10,   1, 
                        LIDE,   1, 
                        BAYE,   1, 
                        EFDE,   1, 
                        PRDE,   1, 
                        BRBE,   1, 
                        CRTE,   1, 
                            ,   1, 
                        W7BE,   1, 
                        W8BE,   1, 
                        PMEE,   1, 
                        INTE,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        DB2E,   1, 
                        DB3E,   1, 
                                Offset (0x52), 
                        LIDS,   1, 
                        BAYS,   1, 
                        EFDS,   1, 
                        PRDS,   1, 
                        BRBS,   1, 
                        CRTS,   1, 
                            ,   1, 
                        W7BS,   1, 
                        W8BS,   1, 
                        DPEM,   1, 
                        DINT,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        DB2S,   1, 
                        DB3S,   1, 
                                Offset (0x57), 
                        RG57,   8, 
                        CTMP,   8, 
                        RG59,   8, 
                        RG5A,   8, 
                        RG5B,   8, 
                        FSPD,   16, 
                                Offset (0x5F), 
                        WLAN,   1, 
                        BLTH,   1, 
                        CPLE,   1, 
                                Offset (0x61), 
                        BRLV,   8, 
                                Offset (0x71), 
                        MBTS,   1, 
                        MBTF,   1, 
                                Offset (0x72), 
                        MBTC,   1, 
                                Offset (0x77), 
                        BA1C,   8, 
                                Offset (0x81), 
                        SBTS,   1, 
                        SBTF,   1, 
                                Offset (0x82), 
                        SBTC,   1, 
                                Offset (0x87), 
                        BA2C,   8, 
                        ABVG,   16, 
                        ACUR,   16, 
                                Offset (0xC1), 
                        MCUR,   16, 
                        MBRM,   16, 
                        MBVG,   16, 
                        BTST,   8, 
                                Offset (0xCA), 
                        ABRM,   16, 
                                Offset (0xD0), 
                        EBPL,   1, 
                                Offset (0xD1), 
                        PWRE,   1, 
                                Offset (0xD2), 
                            ,   6, 
                        VAUX,   1, 
                                Offset (0xD6), 
                        DBPL,   8, 
                                Offset (0xD8), 
                        LFCC,   16, 
                        BTSN,   16, 
                        BTDC,   16, 
                        BTDV,   16, 
                        BTMN,   8, 
                        BTMD,   8, 
                                Offset (0xE7), 
                        GQKS,   7, 
                                Offset (0xE9), 
                        Q8CF,   1, 
                                Offset (0xEA), 
                        PCWL,   8, 
                        PCWH,   8, 
                        TRDV,   3
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        SMW0,   16
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        SMB0,   8
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD0,   64
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD1,   128
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD2,   192
                    }

                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x1C), 
                        FLD3,   256
                    }

                    Mutex (MUT0, 0x00)
                    Mutex (MUT1, 0x00)
                    Method (SMRD, 4, NotSerialized)
                    {
                        If (LEqual (\_SB.ECOK, 0x00))
                        {
                            Return (0xFF)
                        }

                        If (LNotEqual (Arg0, 0x07))
                        {
                            If (LNotEqual (Arg0, 0x09))
                            {
                                If (LNotEqual (Arg0, 0x0B))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            Store (0x00, Local3)
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
                                Increment (Local3)
                                If (LEqual (Local3, 0x32))
                                {
                                    And (SMST, 0x40, SMST)
                                    Store (Arg2, SMCM)
                                    Store (Arg1, SMAD)
                                    Store (Arg0, SMPR)
                                    Store (0x00, Local3)
                                }
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Decrement (Local0)
                            }
                        }

                        If (Local0)
                        {
                            Store (And (Local1, 0x1F), Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x07))
                            {
                                Store (SMB0, Arg3)
                            }

                            If (LEqual (Arg0, 0x09))
                            {
                                Store (SMW0, Arg3)
                            }

                            If (LEqual (Arg0, 0x0B))
                            {
                                Store (BCNT, Local3)
                                ShiftRight (0x0100, 0x03, Local2)
                                If (LGreater (Local3, Local2))
                                {
                                    Store (Local2, Local3)
                                }

                                If (LLess (Local3, 0x09))
                                {
                                    Store (FLD0, Local2)
                                }
                                Else
                                {
                                    If (LLess (Local3, 0x11))
                                    {
                                        Store (FLD1, Local2)
                                    }
                                    Else
                                    {
                                        If (LLess (Local3, 0x19))
                                        {
                                            Store (FLD2, Local2)
                                        }
                                        Else
                                        {
                                            Store (FLD3, Local2)
                                        }
                                    }
                                }

                                Increment (Local3)
                                Store (Buffer (Local3) {}, Local4)
                                Decrement (Local3)
                                Store (Zero, Local5)
                                While (LGreater (Local3, Local5))
                                {
                                    GBFE (Local2, Local5, RefOf (Local6))
                                    PBFE (Local4, Local5, Local6)
                                    Increment (Local5)
                                }

                                PBFE (Local4, Local5, 0x00)
                                Store (Local4, Arg3)
                            }
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (SMWR, 4, NotSerialized)
                    {
                        If (LEqual (\_SB.ECOK, 0x00))
                        {
                            Return (0xFF)
                        }

                        If (LNotEqual (Arg0, 0x06))
                        {
                            If (LNotEqual (Arg0, 0x08))
                            {
                                If (LNotEqual (Arg0, 0x0A))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            If (LEqual (Arg0, 0x06))
                            {
                                Store (Arg3, SMB0)
                            }

                            If (LEqual (Arg0, 0x08))
                            {
                                Store (Arg3, SMW0)
                            }

                            If (LEqual (Arg0, 0x0A))
                            {
                                Store (Arg3, SMD0)
                            }

                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            Store (0x00, Local3)
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
                                Increment (Local3)
                                If (LEqual (Local3, 0x32))
                                {
                                    And (SMST, 0x40, SMST)
                                    Store (Arg2, SMCM)
                                    Store (Arg1, SMAD)
                                    Store (Arg0, SMPR)
                                    Store (0x00, Local3)
                                }
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Decrement (Local0)
                            }
                        }

                        If (Local0)
                        {
                            Store (And (Local1, 0x1F), Local0)
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (APOL, 1, NotSerialized)
                    {
                        Store (Arg0, DBPL)
                        Store (0x01, EBPL)
                    }

                    Name (PSTA, 0x00)
                    Method (CPOL, 1, NotSerialized)
                    {
                        If (LEqual (PSTA, 0x00))
                        {
                            If (LNotEqual (\_SB.ECOK, 0x00))
                            {
                                APOL (Arg0)
                                Store (0x01, PSTA)
                            }
                        }
                    }
                }
            }

            Device (SMB0)
            {
                Name (_ADR, 0x00010001)
                OperationRegion (SMCF, PCI_Config, 0x48, 0x04)
                Field (SMCF, AnyAcc, NoLock, Preserve)
                {
                    SMPM,   4
                }

                OperationRegion (SBA0, PCI_Config, 0x50, 0x04)
                Field (SBA0, AnyAcc, NoLock, Preserve)
                {
                    SB50,   16
                }

                OperationRegion (SBA1, PCI_Config, 0x54, 0x04)
                Field (SBA1, AnyAcc, NoLock, Preserve)
                {
                    SB54,   16
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x00020000)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (USB1)
            {
                Name (_ADR, 0x00020001)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x00020002)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (ACI0)
            {
                Name (_ADR, 0x00060000)
            }

            Device (MCI0)
            {
                Name (_ADR, 0x00060001)
                Name (_PRW, Package (0x02)
                {
                    0x07, 
                    0x03
                })
            }

            Device (IDE0)
            {
                Name (_ADR, 0x00080000)
                Name (SID4, 0x00)
                Name (SID5, 0x00)
                Name (SFLG, 0x00)
                Name (SID0, 0x00)
                Name (SID1, 0x00)
                Name (SID2, 0x00)
                Name (SID3, 0x00)
                OperationRegion (A090, PCI_Config, 0x50, 0x18)
                Field (A090, DWordAcc, NoLock, Preserve)
                {
                    ID20,   16, 
                            Offset (0x08), 
                    IDTS,   16, 
                    IDTP,   16, 
                    ID22,   32, 
                    UMSS,   16, 
                    UMSP,   16
                }

                Name (IDEP, Buffer (0x14) {})
                Name (IDES, Buffer (0x14) {})
                Method (GTM, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (IDTP, Local0)
                        Store (UMSP, Local1)
                        Store (IDEP, Local2)
                    }
                    Else
                    {
                        Store (IDTS, Local0)
                        Store (UMSS, Local1)
                        Store (IDES, Local2)
                    }

                    CreateDWordField (Local2, 0x00, PIO0)
                    CreateDWordField (Local2, 0x04, DMA0)
                    CreateDWordField (Local2, 0x08, PIO1)
                    CreateDWordField (Local2, 0x0C, DMA1)
                    CreateDWordField (Local2, 0x10, FLAG)
                    Store (0x10, FLAG)
                    And (Local0, 0x0F00, Local3)
                    And (Local0, 0xF000, Local4)
                    ShiftRight (Local3, 0x08, Local3)
                    ShiftRight (Local4, 0x0C, Local4)
                    Add (Local3, Local4, Local3)
                    Multiply (Add (Local3, 0x02), 0x1E, PIO0)
                    If (LLessEqual (PIO0, 0xB4))
                    {
                        Or (FLAG, 0x02, FLAG)
                    }

                    If (And (Local1, 0x4000))
                    {
                        Or (FLAG, 0x01, FLAG)
                        And (Local1, 0x0700, Local3)
                        ShiftRight (Local3, 0x08, Local3)
                        Store (U2T (Local3), DMA0)
                    }
                    Else
                    {
                        Store (PIO0, DMA0)
                    }

                    And (Local0, 0x0F, Local3)
                    And (Local0, 0xF0, Local4)
                    ShiftRight (Local4, 0x04, Local4)
                    Add (Local3, Local4, Local3)
                    Multiply (Add (Local3, 0x02), 0x1E, PIO1)
                    If (LLessEqual (PIO1, 0xB4))
                    {
                        Or (FLAG, 0x08, FLAG)
                    }

                    If (And (Local1, 0x40))
                    {
                        Or (FLAG, 0x04, FLAG)
                        And (Local1, 0x07, Local3)
                        Store (U2T (Local3), DMA1)
                    }
                    Else
                    {
                        Store (PIO1, DMA1)
                    }

                    If (LEqual (Arg0, 0x00))
                    {
                        Store (Local2, IDEP)
                        Return (IDEP)
                    }
                    Else
                    {
                        Store (Local2, IDES)
                        Return (IDES)
                    }
                }

                Method (U2T, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Return (0x3C)
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Return (0x5A)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Return (0x78)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Return (0x96)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Return (0x2D)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Return (0x1E)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Return (0x14)
                    }

                    Return (0x0F)
                }

                Method (T2U, 1, NotSerialized)
                {
                    If (LGreater (Arg0, 0x78))
                    {
                        Return (0x03)
                    }

                    If (LGreater (Arg0, 0x5A))
                    {
                        Return (0x02)
                    }

                    If (LGreater (Arg0, 0x3C))
                    {
                        Return (0x01)
                    }

                    If (LGreater (Arg0, 0x2D))
                    {
                        Return (0x00)
                    }

                    If (LGreater (Arg0, 0x1E))
                    {
                        Return (0x04)
                    }

                    If (LGreater (Arg0, 0x14))
                    {
                        Return (0x05)
                    }

                    If (LGreater (Arg0, 0x0F))
                    {
                        Return (0x06)
                    }

                    Return (0x07)
                }

                Method (T2D, 1, NotSerialized)
                {
                    If (LGreater (Arg0, 0x01E0))
                    {
                        Return (0xA8)
                    }

                    If (LGreater (Arg0, 0x0186))
                    {
                        Return (0x77)
                    }

                    If (LGreater (Arg0, 0xF0))
                    {
                        Return (0x47)
                    }

                    If (LGreater (Arg0, 0xB4))
                    {
                        Return (0x33)
                    }

                    If (LGreater (Arg0, 0x96))
                    {
                        Return (0x22)
                    }

                    If (LGreater (Arg0, 0x78))
                    {
                        Return (0x21)
                    }

                    Return (0x20)
                }

                Method (STM, 4, NotSerialized)
                {
                    If (SX)
                    {
                        Store (SID0, ID20)
                        Store (SID1, IDTS)
                        Store (SID2, IDTP)
                        Store (SID3, ID22)
                        Store (SID4, UMSS)
                        Store (SID5, UMSP)
                    }
                    Else
                    {
                        Store (ID20, SID0)
                        Store (IDTS, SID1)
                        Store (IDTP, SID2)
                        Store (ID22, SID3)
                        Store (UMSS, SID4)
                        Store (UMSP, SID5)
                    }

                    Store (0x00, SX)
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    If (LEqual (Arg3, 0x00))
                    {
                        Store (SID2, Local0)
                        Store (SID5, Local1)
                    }
                    Else
                    {
                        Store (SID1, Local0)
                        Store (SID4, Local1)
                    }

                    If (LNotEqual (PIO0, 0xFFFFFFFF))
                    {
                        And (Local0, 0xFF, Local0)
                        ShiftLeft (T2D (PIO0), 0x08, Local2)
                        Or (Local0, Local2, Local0)
                    }

                    If (LNotEqual (PIO1, 0xFFFFFFFF))
                    {
                        And (Local0, 0xFF00, Local0)
                        Or (Local0, T2D (PIO1), Local0)
                    }

                    If (And (FLAG, 0x01))
                    {
                        And (Local1, 0xFF, Local1)
                        ShiftLeft (T2U (DMA0), 0x08, Local2)
                        Or (0xC000, Local2, Local2)
                        Or (Local2, Local1, Local1)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, 0xFFFFFFFF))
                        {
                            And (Local0, 0xFF, Local0)
                            ShiftLeft (T2D (DMA0), 0x08, Local2)
                            Or (Local0, Local2, Local0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        And (Local1, 0xFF00, Local1)
                        Or (0xC0, T2U (DMA1), Local2)
                        Or (Local2, Local1, Local1)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, 0xFFFFFFFF))
                        {
                            And (Local0, 0xFF00, Local0)
                            Or (Local0, T2D (DMA1), Local0)
                        }
                    }

                    If (LEqual (Arg3, 0x00))
                    {
                        Store (Local0, IDTP)
                        Store (Local1, UMSP)
                    }
                    Else
                    {
                        Store (Local0, IDTS)
                        Store (Local1, UMSS)
                    }
                }

                Method (GTF, 2, NotSerialized)
                {
                    Store (Buffer (0x07)
                        {
                            0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                        }, Local0)
                    CreateByteField (Local0, 0x01, MODE)
                    CreateByteField (Local0, 0x05, DRIV)
                    Store (Arg1, DRIV)
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (IDEP, Local1)
                    }
                    Else
                    {
                        Store (IDES, Local1)
                    }

                    CreateDWordField (Local1, 0x00, PIO0)
                    CreateDWordField (Local1, 0x04, DMA0)
                    CreateDWordField (Local1, 0x08, PIO1)
                    CreateDWordField (Local1, 0x0C, DMA1)
                    CreateDWordField (Local1, 0x10, FLGX)
                    If (LEqual (Arg1, 0xA0))
                    {
                        Store (PIO0, Local2)
                        Store (DMA0, Local3)
                        And (FLGX, 0x01, FLGX)
                    }
                    Else
                    {
                        Store (PIO1, Local2)
                        Store (DMA1, Local3)
                        And (FLGX, 0x04, FLGX)
                    }

                    Store (FLGX, Local1)
                    If (LGreater (Local2, 0x0186))
                    {
                        Store (0x00, Local2)
                    }
                    Else
                    {
                        If (LGreater (Local2, 0xF0))
                        {
                            Store (0x01, Local2)
                        }
                        Else
                        {
                            If (LGreater (Local2, 0xB4))
                            {
                                Store (0x02, Local2)
                            }
                            Else
                            {
                                If (LGreater (Local2, 0x78))
                                {
                                    Store (0x03, Local2)
                                }
                                Else
                                {
                                    Store (0x04, Local2)
                                }
                            }
                        }
                    }

                    Or (0x08, Local2, MODE)
                    Store (Local0, Local2)
                    If (FLGX)
                    {
                        If (LGreater (Local3, 0x5A))
                        {
                            Store (0x00, Local3)
                        }
                        Else
                        {
                            If (LGreater (Local3, 0x3C))
                            {
                                Store (0x01, Local3)
                            }
                            Else
                            {
                                If (LGreater (Local3, 0x2D))
                                {
                                    Store (0x02, Local3)
                                }
                                Else
                                {
                                    If (LGreater (Local3, 0x1E))
                                    {
                                        Store (0x03, Local3)
                                    }
                                    Else
                                    {
                                        If (LGreater (Local3, 0x14))
                                        {
                                            Store (0x04, Local3)
                                        }
                                        Else
                                        {
                                            If (LGreater (Local3, 0x0F))
                                            {
                                                Store (0x05, Local3)
                                            }
                                            Else
                                            {
                                                Store (0x06, Local3)
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Or (0x40, Local3, MODE)
                    }
                    Else
                    {
                        If (LEqual (Local3, 0xFFFFFFFF))
                        {
                            Return (Local0)
                        }
                        Else
                        {
                            If (LGreater (Local3, 0x96))
                            {
                                Store (0x00, Local3)
                            }
                            Else
                            {
                                If (LGreater (Local3, 0x78))
                                {
                                    Store (0x01, Local3)
                                }
                                Else
                                {
                                    Store (0x02, Local3)
                                }
                            }

                            Or (0x20, Local3, MODE)
                        }
                    }

                    Concatenate (Local0, Local2, Local1)
                    Return (Local1)
                }

                Device (PRI0)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (Buffer (0x14)
                        {
                            /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x1B, 0x00, 0x00, 0x00
                        })
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        STM (Arg0, Arg1, Arg2, 0x00)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x00, 0xA0))
                        }

                        Name (_PSC, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0x00, _PSC)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, _PSC)
                            \_SB.PCI0.LPC0.PHSR (0x03, 0x00)
                            Sleep (0x01F4)
                        }
                    }
                }

                Device (SEC0)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (Buffer (0x14)
                        {
                            /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x1B, 0x00, 0x00, 0x00
                        })
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        STM (Arg0, Arg1, Arg2, 0x01)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x01, 0xA0))
                        }
                    }
                }
            }

            Device (P2P0)
            {
                Name (_ADR, 0x000A0000)
                Name (_UID, 0x02)
                OperationRegion (A080, PCI_Config, 0x19, 0x01)
                Field (A080, ByteAcc, NoLock, Preserve)
                {
                    SECB,   8
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRT, Package (0x05)
                {
                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x01, 
                        \_SB.PCI0.LNK5, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x01, 
                        \_SB.PCI0.LNK5, 
                        0x00
                    }
                })
                Device (GIGA)
                {
                    Name (_ADR, 0x00060000)
                    Name (_PRW, Package (0x02)
                    {
                        0x00, 
                        0x04
                    })
                    Name (LANP, 0x00)
                    Method (_PSW, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (0x00, LANP)
                        }
                        Else
                        {
                            Store (0x01, LANP)
                        }
                    }
                }
            }

            Device (AGP0)
            {
                Name (_ADR, 0x000B0000)
                Name (_UID, 0x03)
                OperationRegion (A1E0, PCI_Config, 0x19, 0x01)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    SECB,   8
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRT, Package (0x01)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }
                })
                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS1, 0, NotSerialized)
                    {
                        Store (0x01, _PSC)
                    }

                    Method (_PS2, 0, NotSerialized)
                    {
                        Store (0x02, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Name (DISW, 0x01)
                    Name (NDSP, 0x00)
                    Name (VRSM, 0x00)
                    Name (PDSP, 0x00)
                    Name (CDSP, 0x00)
                    Name (TGLT, Package (0x04)
                    {
                        Package (0x08)
                        {
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01
                        }, 

                        Package (0x08)
                        {
                            0x01, 
                            0x02, 
                            0x03, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01
                        }, 

                        Package (0x08)
                        {
                            0x01, 
                            0x05, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01
                        }, 

                        Package (0x08)
                        {
                            0x01, 
                            0x02, 
                            0x03, 
                            0x05, 
                            0x01, 
                            0x01, 
                            0x01, 
                            0x01
                        }
                    })
                    Name (TGLP, 0x00)
                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Name (_PSC, 0x00)
                        Name (_S3D, 0x03)
                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0x00, _PSC)
                        }

                        Method (_PS1, 0, NotSerialized)
                        {
                            Store (0x01, _PSC)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, _PSC)
                        }

                        Name (_DCS, 0x1B)
                        Name (_DGS, 0x00)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, 0x01))
                            {
                                Store ("LCD._DSS(1) called", Debug)
                                Or (NDSP, 0x01, NDSP)
                            }
                            Else
                            {
                                Store ("LCD._DSS(0) called", Debug)
                                And (NDSP, 0xFE, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Store ("LCD._DSS, update next _DGS", Debug)
                                Or (And (^^LCD._DCS, 0xFD), ShiftLeft (And (NDSP, 0x01), 
                                    0x01), ^^LCD._DCS)
                                Or (And (^^CRT._DCS, 0xFD), And (NDSP, 0x02), ^^CRT._DCS)
                                Or (And (^^TV._DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    0x01), ^^TV._DCS)
                                UDGS ()
                            }
                        }
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Name (_PSC, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0x00, _PSC)
                        }

                        Method (_PS1, 0, NotSerialized)
                        {
                            Store (0x01, _PSC)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, _PSC)
                        }

                        Name (_DCS, 0x1B)
                        Name (_DGS, 0x00)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, 0x01))
                            {
                                Store ("CRT._DSS(1) called", Debug)
                                Or (NDSP, 0x02, NDSP)
                            }
                            Else
                            {
                                Store ("CRT._DSS(0) called", Debug)
                                And (NDSP, 0xFD, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Store ("CRT._DSS, update next _DGS", Debug)
                                Or (And (^^LCD._DCS, 0xFD), ShiftLeft (And (NDSP, 0x01), 
                                    0x01), ^^LCD._DCS)
                                Or (And (^^CRT._DCS, 0xFD), And (NDSP, 0x02), ^^CRT._DCS)
                                Or (And (^^TV._DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    0x01), ^^TV._DCS)
                                UDGS ()
                            }
                        }
                    }

                    Device (TV)
                    {
                        Name (_ADR, 0x0200)
                        Name (_PSC, 0x00)
                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0x00, _PSC)
                        }

                        Method (_PS1, 0, NotSerialized)
                        {
                            Store (0x01, _PSC)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, _PSC)
                        }

                        Name (_DCS, 0x1B)
                        Name (_DGS, 0x00)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, 0x01))
                            {
                                Store ("TV_._DSS(1) called", Debug)
                                Or (NDSP, 0x04, NDSP)
                            }
                            Else
                            {
                                Store ("TV_._DSS(0) called", Debug)
                                And (NDSP, 0xFB, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, 0x00))
                            {
                                Store ("TV_._DSS, update next _DGS", Debug)
                                Or (And (^^LCD._DCS, 0xFD), ShiftLeft (And (NDSP, 0x01), 
                                    0x01), ^^LCD._DCS)
                                Or (And (^^CRT._DCS, 0xFD), And (NDSP, 0x02), ^^CRT._DCS)
                                Or (And (^^TV._DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    0x01), ^^TV._DCS)
                                UDGS ()
                            }
                        }
                    }

                    Method (_INI, 0, NotSerialized)
                    {
                        USTA ()
                        Store (CDSP, PDSP)
                        Store (CDSP, Local1)
                        Or (ShiftRight (And (Local1, 0x10), 0x03), 0x1D, ^LCD._DCS)
                        Or (Or (ShiftLeft (And (Local1, 0x02), 0x03), ShiftRight (
                            And (Local1, 0x20), 0x04)), 0x0D, ^CRT._DCS)
                        Or (Or (ShiftLeft (And (Local1, 0x04), 0x02), ShiftRight (
                            And (Local1, 0x40), 0x05)), 0x0D, ^TV._DCS)
                        ShiftRight (Local1, 0x04, NDSP)
                        Store (ShiftRight (And (^LCD._DCS, 0x02), 0x01), ^LCD._DGS)
                        Store (ShiftRight (And (^CRT._DCS, 0x02), 0x01), ^CRT._DGS)
                        Store (ShiftRight (And (^TV._DCS, 0x02), 0x01), ^TV._DGS)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (Arg0, DISW)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x00010200
                        })
                    }

                    Method (DRUL, 1, NotSerialized)
                    {
                        USTA ()
                        If (LNotEqual (And (PDSP, 0x07), And (CDSP, 0x07
                            )))
                        {
                            UDGS ()
                            Store (CDSP, PDSP)
                        }

                        Store (CDSP, Local2)
                        Store (^CRT._DCS, Local1)
                        Or (Or (ShiftLeft (And (Local2, 0x02), 0x03), ShiftRight (
                            And (Local2, 0x20), 0x04)), And (Local1, 0x0D), 
                            ^CRT._DCS)
                        Store (^TV._DCS, Local3)
                        Or (Or (ShiftLeft (And (Local2, 0x04), 0x02), ShiftRight (
                            And (Local2, 0x40), 0x05)), And (Local3, 0x0D), 
                            ^TV._DCS)
                        If (LEqual (Arg0, 0x01))
                        {
                            If (LOr (LAnd (^CRT._DGS, LNot (And (^CRT._DCS, 0x10))), LAnd (
                                ^TV._DGS, LNot (And (^TV._DCS, 0x10)))))
                            {
                                UDGS ()
                                Return (0x00)
                            }
                            Else
                            {
                                Notify (VGA, 0x80)
                                Return (0x00)
                            }
                        }
                    }

                    Method (USTA, 0, NotSerialized)
                    {
                        Store (\_SB.PCI0.LPC0.PHSR (0x01, 0x00), CDSP)
                        And (CDSP, 0x0F, Local1)
                        If (LEqual (Local1, 0x03))
                        {
                            Store (0x01, TGLP)
                        }
                        Else
                        {
                            If (LEqual (Local1, 0x05))
                            {
                                Store (0x02, TGLP)
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x07))
                                {
                                    Store (0x03, TGLP)
                                }
                                Else
                                {
                                    Store (0x00, TGLP)
                                }
                            }
                        }
                    }

                    Method (UDGS, 0, NotSerialized)
                    {
                        And (^LCD._DGS, 0x01, Local0)
                        Or (Local0, ShiftLeft (And (^CRT._DGS, 0x01), 0x01), Local0)
                        Or (Local0, ShiftLeft (And (^TV._DGS, 0x01), 0x02), Local0)
                        Store (DerefOf (Index (DerefOf (Index (TGLT, TGLP)), Local0)), 
                            Local1)
                        And (Local1, 0x01, ^LCD._DGS)
                        ShiftRight (And (Local1, 0x02), 0x01, ^CRT._DGS)
                        ShiftRight (And (Local1, 0x04), 0x02, ^TV._DGS)
                    }
                }
            }

            Device (AMD3)
            {
                Name (_ADR, 0x00180003)
                OperationRegion (K8F3, PCI_Config, 0xE0, 0x10)
                Field (K8F3, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x05), 
                    Z003,   6
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (Z003, \_SB.TOFF)
                }
            }
        }

        Scope (\)
        {
            Name (PICF, 0x00)
            Method (_PIC, 1, NotSerialized)
            {
                Store (Arg0, PICF)
            }

            OperationRegion (\_SB.PCI0.LPC0.PIRQ, PCI_Config, 0x7C, 0x0C)
            Field (\_SB.PCI0.LPC0.PIRQ, AnyAcc, NoLock, Preserve)
            {
                INTW,   4, 
                INTX,   4, 
                INTY,   4, 
                INTZ,   4, 
                INTE,   4, 
                        Offset (0x04), 
                ISCI,   4, 
                ITCO,   4, 
                ISMB,   4, 
                IUS2,   4, 
                    ,   12, 
                ITID,   4, 
                IUS0,   4, 
                IUS1,   4, 
                IMAC,   4, 
                        Offset (0x0A), 
                IACI,   4, 
                IMCI,   4, 
                IPID,   4, 
                ISID,   4
            }
        }

        Scope (\_SB.PCI0)
        {
            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, )
                    {3,4,5,6,7,10,11,12,14,15}
            })
            Name (BUFB, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared, _Y2E)
                    {}
            })
            CreateWordField (BUFB, \_SB.PCI0._Y2E._INT, IRQV)
            Method (CRS, 1, Serialized)
            {
                If (Arg0)
                {
                    ShiftLeft (0x01, Arg0, IRQV)
                }
                Else
                {
                    Store (Zero, IRQV)
                }

                Return (BUFB)
            }

            Method (SRS, 1, Serialized)
            {
                CreateWordField (Arg0, 0x01, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Decrement (Local0)
                Return (Local0)
            }

            Name (Z004, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000016,
                }
            })
            Name (BUFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000014,
                    0x00000015,
                }
            })
            Method (CRSI, 1, Serialized)
            {
                Name (IRZ5, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y2F)
                    {
                        0x00000007,
                    }
                })
                CreateWordField (IRZ5, \_SB.PCI0.CRSI._Y2F._INT, INZ5)
                Store (0x00, Local0)
                If (LEqual (Arg0, 0x08))
                {
                    Store (0x14, Local0)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Store (0x15, Local0)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x16, Local0)
                }

                Store (Local0, INZ5)
                Return (IRZ5)
            }

            Method (SRSI, 1, Serialized)
            {
                CreateWordField (Arg0, 0x05, IRZ6)
                Store (0x00, Local0)
                If (LEqual (IRZ6, 0x14))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (IRZ6, 0x15))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (IRZ6, 0x16))
                {
                    Store (0x02, Local0)
                }

                Return (Local0)
            }

            Name (BUFE, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x00000010,
                    0x00000011,
                    0x00000012,
                    0x00000013,
                }
            })
            Method (CRSE, 1, Serialized)
            {
                Name (IRZ7, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y30)
                    {
                        0x00000007,
                    }
                })
                CreateWordField (IRZ7, \_SB.PCI0.CRSE._Y30._INT, INZ7)
                Store (0x00, Local0)
                If (LEqual (Arg0, 0x08))
                {
                    Store (0x10, Local0)
                }

                If (LEqual (Arg0, 0x01))
                {
                    Store (0x11, Local0)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x12, Local0)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Store (0x13, Local0)
                }

                Store (Local0, INZ7)
                Return (IRZ7)
            }

            Method (SRSE, 1, Serialized)
            {
                CreateWordField (Arg0, 0x05, IRZ8)
                Store (0x00, Local0)
                If (LEqual (IRZ8, 0x10))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (IRZ8, 0x11))
                {
                    Store (0x01, Local0)
                }

                If (LEqual (IRZ8, 0x12))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (IRZ8, 0x13))
                {
                    Store (0x0D, Local0)
                }

                Return (Local0)
            }

            Device (LNK1)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x01)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTW)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTW)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFE)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTW))
                    }
                    Else
                    {
                        Return (CRSE (INTW))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTW)
                    }
                    Else
                    {
                        Store (SRSE (Arg0), INTW)
                    }
                }
            }

            Device (LNK2)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x02)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTX)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTX)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFE)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTX))
                    }
                    Else
                    {
                        Return (CRSE (INTX))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTX)
                    }
                    Else
                    {
                        Store (SRSE (Arg0), INTX)
                    }
                }
            }

            Device (LNK3)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x03)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTY)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTY)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFE)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTY))
                    }
                    Else
                    {
                        Return (CRSE (INTY))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTY)
                    }
                    Else
                    {
                        Store (SRSE (Arg0), INTY)
                    }
                }
            }

            Device (LNK4)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x04)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTZ)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTZ)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFE)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTZ))
                    }
                    Else
                    {
                        Return (CRSE (INTZ))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTZ)
                    }
                    Else
                    {
                        Store (SRSE (Arg0), INTZ)
                    }
                }
            }

            Device (LNK5)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x05)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTE)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTE)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFE)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (INTE))
                    }
                    Else
                    {
                        Return (CRSE (INTE))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), INTE)
                    }
                    Else
                    {
                        Store (SRSE (Arg0), INTE)
                    }
                }
            }

            Device (LSMB)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x06)
                Method (_STA, 0, NotSerialized)
                {
                    If (ISMB)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, ISMB)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (ISMB))
                    }
                    Else
                    {
                        Return (CRSI (ISMB))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), ISMB)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), ISMB)
                    }
                }
            }

            Device (LUS0)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x07)
                Method (_STA, 0, NotSerialized)
                {
                    If (IUS0)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IUS0)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IUS0))
                    }
                    Else
                    {
                        Return (CRSI (IUS0))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IUS0)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IUS0)
                    }
                }
            }

            Device (LUS1)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x08)
                Method (_STA, 0, NotSerialized)
                {
                    If (IUS1)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IUS1)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IUS1))
                    }
                    Else
                    {
                        Return (CRSI (IUS1))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IUS1)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IUS1)
                    }
                }
            }

            Device (LUS2)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x09)
                Method (_STA, 0, NotSerialized)
                {
                    If (IUS2)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IUS2)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IUS2))
                    }
                    Else
                    {
                        Return (CRSI (IUS2))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IUS2)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IUS2)
                    }
                }
            }

            Device (LMAC)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0A)
                Method (_STA, 0, NotSerialized)
                {
                    If (IMAC)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IMAC)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IMAC))
                    }
                    Else
                    {
                        Return (CRSI (IMAC))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IMAC)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IMAC)
                    }
                }
            }

            Device (LACI)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0B)
                Method (_STA, 0, NotSerialized)
                {
                    If (IACI)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IACI)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (Z004)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IACI))
                    }
                    Else
                    {
                        Return (CRSI (IACI))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IACI)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IACI)
                    }
                }
            }

            Device (LMCI)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0C)
                Method (_STA, 0, NotSerialized)
                {
                    If (IMCI)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IMCI)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IMCI))
                    }
                    Else
                    {
                        Return (CRSI (IMCI))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IMCI)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IMCI)
                    }
                }
            }

            Device (LPID)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0D)
                Method (_STA, 0, NotSerialized)
                {
                    If (IPID)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IPID)
                    Store (0x00, ISID)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (IPID))
                    }
                    Else
                    {
                        Return (CRSI (IPID))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), IPID)
                        Store (SRS (Arg0), ISID)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), IPID)
                        Store (SRSI (Arg0), ISID)
                    }
                }
            }

            Device (LTID)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0E)
                Method (_STA, 0, NotSerialized)
                {
                    If (ITID)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, ITID)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (BUFA)
                    }
                    Else
                    {
                        Return (BUFI)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (CRS (ITID))
                    }
                    Else
                    {
                        Return (CRSI (ITID))
                    }
                }

                Method (_SRS, 1, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Store (SRS (Arg0), ITID)
                    }
                    Else
                    {
                        Store (SRSI (Arg0), ITID)
                    }
                }
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Name (_PRW, Package (0x02)
            {
                0x2F, 
                0x03
            })
            Method (_LID, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.LIDS)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (ACAD)
        {
            Method (_HID, 0, NotSerialized)
            {
                Return ("ACPI0003")
            }

            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (ACST, 0x00)
            Method (_PSR, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.ACDF, ACST)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                }
                Else
                {
                    Store (0x01, ACST)
                }

                If (ACST)
                {
                    Store (0x01, Local0)
                    Store (0x00, \_SB.BAT1.BCRI)
                }
                Else
                {
                    Store (0x00, Local0)
                }

                Return (Local0)
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, 0x01)
            Name (CBTI, 0x00)
            Name (PBTI, 0x00)
            Name (BTIN, 0x00)
            Name (BTCH, 0x00)
            Name (BIFI, 0x00)
            Name (SEL0, 0x00)
            Name (BCRI, 0x00)
            Name (PBIF, Package (0x0D)
            {
                0x01, 
                0x1130, 
                0x1130, 
                0x01, 
                0x2B5C, 
                0x012C, 
                0x84, 
                0x20, 
                0x20, 
                "BAT1      ", 
                "11        ", 
                "11        ", 
                "11        "
            })
            Name (PBST, Package (0x04)
            {
                0x00, 
                Z005, 
                Z005, 
                0x2710
            })
            Name (ERRC, 0x00)
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                If (BTIN)
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                If (LEqual (BIFI, 0x00))
                {
                    \_SB.BAT1.UBIF ()
                    Store (0x01, BIFI)
                }

                Return (PBIF)
            }

            Name (LFCC, 0x1130)
            Method (UBIF, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.BTDC, Local0)
                    Store (\_SB.PCI0.LPC0.EC0.LFCC, Local1)
                    Store (\_SB.PCI0.LPC0.EC0.BTDV, Local2)
                    Store (\_SB.PCI0.LPC0.EC0.BTMD, Local3)
                    Store (\_SB.PCI0.LPC0.EC0.BTMN, Local4)
                    Store (\_SB.PCI0.LPC0.EC0.BTSN, Local5)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    Store (Local0, Index (PBIF, 0x01))
                    Store (Local1, Index (PBIF, 0x02))
                    Store (Local2, Index (PBIF, 0x04))
                    Store ("LION", Index (PBIF, 0x0B))
                    Store (Local1, LFCC)
                    And (Local3, 0x0F, Local3)
                    If (LEqual (Local3, 0x01))
                    {
                        Store ("ZP01", Index (PBIF, 0x09))
                    }
                    Else
                    {
                        If (LEqual (Local3, 0x02))
                        {
                            Store ("ZP02", Index (PBIF, 0x09))
                        }
                        Else
                        {
                            If (LEqual (Local3, 0x03))
                            {
                                Store ("ZP03", Index (PBIF, 0x09))
                            }
                        }
                    }

                    If (LEqual (Local4, 0x08))
                    {
                        Store ("MOTOROLA", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x06))
                        {
                            Store ("SIMPLO", Index (PBIF, 0x0C))
                        }
                        Else
                        {
                            If (LEqual (Local4, 0x05))
                            {
                                Store ("SANYO", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local4, 0x04))
                                {
                                    Store ("SONY", Index (PBIF, 0x0C))
                                }
                            }
                        }
                    }

                    Store (ITOS (ToBCD (Local5)), Index (PBIF, 0x0A))
                }
            }

            Name (RCAP, 0x00)
            Method (_BST, 0, NotSerialized)
            {
                If (LEqual (BTIN, 0x00))
                {
                    Store (0x00, Index (PBST, 0x00))
                    Store (0xFFFFFFFF, Index (PBST, 0x01))
                    Store (0xFFFFFFFF, Index (PBST, 0x02))
                    Store (0xFFFFFFFF, Index (PBST, 0x03))
                    Return (PBST)
                }

                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.MBTC, Local0)
                    Store (\_SB.PCI0.LPC0.EC0.MBRM, Local1)
                    Store (\_SB.PCI0.LPC0.EC0.MBVG, Local2)
                    Store (\_SB.PCI0.LPC0.EC0.MCUR, Local3)
                    Store (\_SB.PCI0.LPC0.EC0.BTST, Local4)
                    Store (\_SB.PCI0.LPC0.EC0.MBTF, Local5)
                    Store (\_SB.PCI0.LPC0.EC0.ACDF, Local6)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    If (Local6)
                    {
                        If (LEqual (Local5, 0x01))
                        {
                            Store (0x00, Local7)
                            Store (LFCC, Local1)
                        }
                        Else
                        {
                            Store (0x02, Local7)
                        }
                    }
                    Else
                    {
                        Store (0x01, Local7)
                    }

                    And (Local4, 0x04, Local4)
                    If (LEqual (Local4, 0x04))
                    {
                        Or (Local7, Local4, Local7)
                    }

                    Store (Local7, Index (PBST, 0x00))
                    If (LNot (And (Local1, 0x8000)))
                    {
                        Store (Local1, Index (PBST, 0x02))
                    }

                    If (LNot (And (Local2, 0x8000)))
                    {
                        Store (Local7, Index (PBST, 0x03))
                    }

                    Store (0xFFFFFFFF, Index (PBST, 0x01))
                }

                Return (PBST)
            }

            Method (Z002, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Store (\_SB.PCI0.LPC0.EC0.SMRD (0x09, 0x14, 0x01, RefOf (Local0)), Local1)
                    If (LNotEqual (Local1, 0xFF))
                    {
                        Store (Local0, SEL0)
                        If (LEqual (And (Local0, 0x01), 0x01))
                        {
                            If (LEqual (\_SB.BAT1.BTIN, 0x00))
                            {
                                Store (0x01, \_SB.BAT1.BTCH)
                                Store (0x00, \_SB.BAT1.BIFI)
                            }

                            Store (0x01, \_SB.BAT1.BTIN)
                        }
                        Else
                        {
                            If (LEqual (\_SB.BAT1.BTIN, 0x01))
                            {
                                Store (0x01, \_SB.BAT1.BTCH)
                                Store (0x00, \_SB.BAT1.BIFI)
                            }

                            Store (0x00, \_SB.BAT1.BTIN)
                        }
                    }
                    Else
                    {
                        If (LEqual (\_SB.BAT1.BTIN, 0x01))
                        {
                            Store (0x01, \_SB.BAT1.BTCH)
                            Store (0x00, BIFI)
                        }

                        Store (0x00, \_SB.BAT1.BTIN)
                    }
                }
            }
        }

        Scope (\_TZ)
        {
            ThermalZone (THRM)
            {
                Method (_TMP, 0, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.CTMP, Local0)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                        Subtract (Local0, \_SB.TOFF, Local0)
                        Return (Add (Multiply (Local0, 0x0A), 0x0AAC))
                    }
                    Else
                    {
                        Return (0x0C3C)
                    }
                }

                Method (_PSV, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x55, 0x0A), 0x0AAC))
                }

                Name (_PSL, Package (0x01)
                {
                    \_PR.CPU0
                })
                Name (_TSP, 0x28)
                Name (_TC1, 0x02)
                Name (_TC2, 0x03)
                Method (_CRT, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x61, 0x0A), 0x0AAC))
                }
            }
        }
    }

    Method (_PTS, 1, NotSerialized)
    {
        \_SB.PCI0.LPC0.PHSR (0x06, 0x00)
        If (\_SB.ECOK)
        {
            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
            If (LEqual (\_SB.PCI0.P2P0.GIGA.LANP, 0x00))
            {
                Store (0x00, \_SB.PCI0.LPC0.EC0.VAUX)
            }
            Else
            {
                Store (0x01, \_SB.PCI0.LPC0.EC0.VAUX)
            }

            Release (\_SB.PCI0.LPC0.EC0.MUT1)
        }

        If (LEqual (Arg0, 0x04))
        {
            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
            Store (0x01, \_SB.PCI0.LPC0.EC0.FLS4)
            Release (\_SB.PCI0.LPC0.EC0.MUT1)
            Store (0x01, INS4)
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            Store (\_SB.PCI0.LPC0.BTEN, \_SB.PCI0.LPC0.EC0.BLTH)
            Store (\_SB.PCI0.LPC0.WLAN, \_SB.PCI0.LPC0.EC0.WLAN)
            Store (0x01, \_SB.PCI0.LPC0.EC0.CPLE)
        }

        If (LEqual (Arg0, 0x03))
        {
            \_SB.PCI0.LPC0.PHSR (0x00, 0x00)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x00, INS4)
        }

        \_SB.PCI0.LPC0.PHSR (0x06, 0x01)
    }

    Scope (_GPE)
    {
        Method (_L00, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P2P0, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L07, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MCI0, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB0, 0x02)
        }

        Method (_L2F, 0, NotSerialized)
        {
            Notify (\_SB.LID, 0x80)
        }
    }

    OperationRegion (NV1, SystemIO, 0x72, 0x02)
    Field (NV1, ByteAcc, NoLock, Preserve)
    {
        INDX,   8, 
        DATA,   8
    }

    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
    {
                Offset (0xFD), 
        PNUM,   8, 
        INS4,   1
    }

    Name (FWSO, "FWSO")
}

