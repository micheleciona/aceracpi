/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20050513
 *
 * Disassembly of DSDT.aml, Mon May 30 16:28:28 2005
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "PTLTD ", "755", 100925440)
{
    OperationRegion (P80G, SystemIO, 0x80, One)
    Field (P80G, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
    }

    OperationRegion (Z000, SystemIO, 0x8042, One)
    Field (Z000, ByteAcc, NoLock, Preserve)
    {
        Z001,   8
    }

    Name (_S0, Package (0x02)
    {
        Zero, 
        Zero
    })
    Name (_S3, Package (0x02)
    {
        0x03, 
        0x03
    })
    Name (_S4, Package (0x02)
    {
        0x04, 
        0x04
    })
    Name (_S5, Package (0x02)
    {
        0x05, 
        0x05
    })
    Method (VTOB, 1, NotSerialized)
    {
        Store (One, Local0)
        ShiftLeft (Local0, Arg0, Local0)
        Return (Local0)
    }

    Method (BTOV, 1, NotSerialized)
    {
        ShiftRight (Arg0, One, Local0)
        Store (Zero, Local1)
        While (Local0)
        {
            Increment (Local1)
            ShiftRight (Local0, One, Local0)
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
                Return (Ones)
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
                0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00
            }, Local0)
        Store (Buffer (0x11)
            {
                "0123456789ABCDEF"
            }, Local7)
        Store (0x08, Local1)
        Store (Zero, Local2)
        Store (Zero, Local3)
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

    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
    }

    Scope (_SB)
    {
        Name (ECOK, Zero)
        Name (TOFF, Zero)
        Scope (\_SB)
        {
            Name (OSTB, Ones)
            OperationRegion (OSTY, SystemMemory, 0x0BEFADE4, One)
            Field (OSTY, AnyAcc, NoLock, Preserve)
            {
                TPOS,   8
            }

            Method (OSTP, 0, NotSerialized)
            {
                If (LEqual (OSTB, Ones))
                {
                    If (CondRefOf (_OSI, Local0))
                    {
                        If (_OSI ("Windows 2001.1"))
                        {
                            Store (0x10, OSTB)
                            Store (0x10, TPOS)
                        }
                        Else
                        {
                            If (_OSI ("Windows 2001"))
                            {
                                Store (0x08, OSTB)
                                Store (0x08, TPOS)
                            }
                            Else
                            {
                                Store (Zero, OSTB)
                                Store (Zero, TPOS)
                            }
                        }
                    }
                    Else
                    {
                        If (CondRefOf (_OS, Local0))
                        {
                            If (SEQL (_OS, "Microsoft Windows"))
                            {
                                Store (One, OSTB)
                                Store (One, TPOS)
                            }
                            Else
                            {
                                If (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                                {
                                    Store (0x02, OSTB)
                                    Store (0x02, TPOS)
                                }
                                Else
                                {
                                    If (SEQL (_OS, "Microsoft Windows NT"))
                                    {
                                        Store (0x04, OSTB)
                                        Store (0x04, TPOS)
                                    }
                                    Else
                                    {
                                        Store (Zero, OSTB)
                                        Store (Zero, TPOS)
                                    }
                                }
                            }
                        }
                        Else
                        {
                            Store (Zero, OSTB)
                            Store (Zero, TPOS)
                        }
                    }
                }

                Return (OSTB)
            }

            Method (SEQL, 2, Serialized)
            {
                Store (SizeOf (Arg0), Local0)
                Store (SizeOf (Arg1), Local1)
                If (LNot (LEqual (Local0, Local1)))
                {
                    Return (Zero)
                }

                Name (BUF0, Buffer (Local0) {})
                Store (Arg0, BUF0)
                Name (BUF1, Buffer (Local0) {})
                Store (Arg1, BUF1)
                Store (Zero, Local2)
                While (LLess (Local2, Local0))
                {
                    Store (DerefOf (Index (BUF0, Local2)), Local3)
                    Store (DerefOf (Index (BUF1, Local2)), Local4)
                    If (LNot (LEqual (Local3, Local4)))
                    {
                        Return (Zero)
                    }

                    Increment (Local2)
                }

                Return (One)
            }
        }

        Device (PCI0)
        {
            Name (_PRW, Package (0x02)
            {
                0x0B, 
                0x05
            })
            Scope (\)
            {
                Name (PICF, Zero)
                Method (_PIC, 1, NotSerialized)
                {
                    Store (Arg0, PICF)
                }
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (LNot (PICF))
                {
                    Return (PICM)
                }
                Else
                {
                    Return (APIC)
                }
            }

            Scope (\_SB.PCI0)
            {
                Name (PICM, Package (0x23)
                {
                    Package (0x04)
                    {
                        0x0007FFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000AFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000AFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000AFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000AFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (APIC, Package (0x0E)
                {
                    Package (0x04)
                    {
                        0x0006FFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0001FFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0x0002FFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0x0003FFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }
                })
            }

            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, Zero)
            Name (_BBN, Zero)
            Name (_UID, Zero)
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            OperationRegion (K8ST, SystemMemory, 0x0BEFAF74, 0x48)
            Field (K8ST, AnyAcc, Lock, Preserve)
            {
                C0_0,   16, 
                C2_0,   16, 
                C4_0,   16, 
                C6_0,   16, 
                C8_0,   16, 
                CA_0,   16, 
                CC_0,   16, 
                CE_0,   16, 
                D0_0,   16, 
                D2_0,   16, 
                D4_0,   16, 
                D6_0,   16, 
                D8_0,   16, 
                DA_0,   16, 
                DC_0,   16, 
                DE_0,   16, 
                E0_0,   16, 
                E2_0,   16, 
                E4_0,   16, 
                E6_0,   16, 
                E8_0,   16, 
                EA_0,   16, 
                EC_0,   16, 
                EE_0,   16, 
                F0_0,   16, 
                F2_0,   16, 
                F4_0,   16, 
                F6_0,   16, 
                F8_0,   16, 
                FA_0,   16, 
                FC_0,   16, 
                FE_0,   16, 
                TOML,   32, 
                TOMH,   32
            }

            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000, // Address Space Granularity
                    0x0000, // Address Range Minimum
                    0x00FF, // Address Range Maximum
                    0x0000, // Address Translation Offset
                    0x0100,,,)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000A0000, // Address Range Minimum
                    0x000BFFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00020000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000C0000, // Address Range Minimum
                    0x000C1FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000C2000, // Address Range Minimum
                    0x000C3FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000C4000, // Address Range Minimum
                    0x000C5FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000C6000, // Address Range Minimum
                    0x000C7FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000C8000, // Address Range Minimum
                    0x000C9FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000CA000, // Address Range Minimum
                    0x000CBFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000CC000, // Address Range Minimum
                    0x000CDFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000CE000, // Address Range Minimum
                    0x000CFFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000D0000, // Address Range Minimum
                    0x000D1FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000D2000, // Address Range Minimum
                    0x000D3FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000D4000, // Address Range Minimum
                    0x000D5FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000D6000, // Address Range Minimum
                    0x000D7FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000D8000, // Address Range Minimum
                    0x000D9FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000DA000, // Address Range Minimum
                    0x000DBFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000DC000, // Address Range Minimum
                    0x000DDFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000DE000, // Address Range Minimum
                    0x000DFFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000E0000, // Address Range Minimum
                    0x000E1FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000E2000, // Address Range Minimum
                    0x000E3FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000E4000, // Address Range Minimum
                    0x000E5FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000E6000, // Address Range Minimum
                    0x000E7FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000E8000, // Address Range Minimum
                    0x000E9FFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000EA000, // Address Range Minimum
                    0x000EBFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000EC000, // Address Range Minimum
                    0x000EDFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x000EE000, // Address Range Minimum
                    0x000EFFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00002000,,,
                    , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000, // Address Space Granularity
                    0x00000000, // Address Range Minimum
                    0xFFFFFFFF, // Address Range Maximum
                    0x00000000, // Address Translation Offset
                    0x00000000,,,
                    , AddressRangeMemory, TypeStatic)
                IO (Decode16, 0x0CF8, 0x0CF8, 0x01, 0x08)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000, // Address Space Granularity
                    0x0000, // Address Range Minimum
                    0x0CF7, // Address Range Maximum
                    0x0000, // Address Translation Offset
                    0x0CF8,,,
                    , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000, // Address Space Granularity
                    0x0D00, // Address Range Minimum
                    0xFFFF, // Address Range Maximum
                    0x0000, // Address Translation Offset
                    0xF300,,,
                    , TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                CreateBitField (RSRC, 0x0188, C0RW)
                CreateDWordField (RSRC, 0x42, C0LN)
                Store (One, C0RW)
                Store (0x2000, C0LN)
                If (And (C0_0, 0x1818))
                {
                    Store (Zero, C0LN)
                }

                CreateBitField (RSRC, 0x0260, C2RW)
                CreateDWordField (RSRC, 0x5D, C2LN)
                Store (One, C2RW)
                Store (0x2000, C2LN)
                If (And (C2_0, 0x1818))
                {
                    Store (Zero, C2LN)
                }

                CreateBitField (RSRC, 0x0338, C4RW)
                CreateDWordField (RSRC, 0x78, C4LN)
                Store (One, C4RW)
                Store (0x2000, C4LN)
                If (And (C4_0, 0x1818))
                {
                    Store (Zero, C4LN)
                }

                CreateBitField (RSRC, 0x0410, C6RW)
                CreateDWordField (RSRC, 0x93, C6LN)
                Store (One, C6RW)
                Store (0x2000, C6LN)
                If (And (C6_0, 0x1818))
                {
                    Store (Zero, C6LN)
                }

                CreateBitField (RSRC, 0x04E8, C8RW)
                CreateDWordField (RSRC, 0xAE, C8LN)
                Store (One, C8RW)
                Store (0x2000, C8LN)
                If (And (C8_0, 0x1818))
                {
                    Store (Zero, C8LN)
                }

                CreateBitField (RSRC, 0x05C0, CARW)
                CreateDWordField (RSRC, 0xC9, CALN)
                Store (One, CARW)
                Store (0x2000, CALN)
                If (And (CA_0, 0x1818))
                {
                    Store (Zero, CALN)
                }

                CreateBitField (RSRC, 0x0698, CCRW)
                CreateDWordField (RSRC, 0xE4, CCLN)
                Store (One, CCRW)
                Store (0x2000, CCLN)
                If (And (CC_0, 0x1818))
                {
                    Store (Zero, CCLN)
                }

                CreateBitField (RSRC, 0x0770, CERW)
                CreateDWordField (RSRC, 0xFF, CELN)
                Store (One, CERW)
                Store (0x2000, CELN)
                If (And (CE_0, 0x1818))
                {
                    Store (Zero, CELN)
                }

                CreateBitField (RSRC, 0x0848, D0RW)
                CreateDWordField (RSRC, 0x011A, D0LN)
                Store (One, D0RW)
                Store (0x2000, D0LN)
                If (And (D0_0, 0x1818))
                {
                    Store (Zero, D0LN)
                }

                CreateBitField (RSRC, 0x0920, D2RW)
                CreateDWordField (RSRC, 0x0135, D2LN)
                Store (One, D2RW)
                Store (0x2000, D2LN)
                If (And (D2_0, 0x1818))
                {
                    Store (Zero, D2LN)
                }

                CreateBitField (RSRC, 0x09F8, D4RW)
                CreateDWordField (RSRC, 0x0150, D4LN)
                Store (One, D4RW)
                Store (0x2000, D4LN)
                If (And (D4_0, 0x1818))
                {
                    Store (Zero, D4LN)
                }

                CreateBitField (RSRC, 0x0AD0, D6RW)
                CreateDWordField (RSRC, 0x016B, D6LN)
                Store (One, D6RW)
                Store (0x2000, D6LN)
                If (And (D6_0, 0x1818))
                {
                    Store (Zero, D6LN)
                }

                CreateBitField (RSRC, 0x0BA8, D8RW)
                CreateDWordField (RSRC, 0x0186, D8LN)
                Store (One, D8RW)
                Store (0x2000, D8LN)
                If (And (D8_0, 0x1818))
                {
                    Store (Zero, D8LN)
                }

                CreateBitField (RSRC, 0x0C80, DARW)
                CreateDWordField (RSRC, 0x01A1, DALN)
                Store (One, DARW)
                Store (0x2000, DALN)
                If (And (DA_0, 0x1818))
                {
                    Store (Zero, DALN)
                }

                CreateBitField (RSRC, 0x0D58, DCRW)
                CreateDWordField (RSRC, 0x01BC, DCLN)
                Store (One, DCRW)
                Store (0x2000, DCLN)
                If (And (DC_0, 0x1818))
                {
                    Store (Zero, DCLN)
                }

                CreateBitField (RSRC, 0x0E30, DERW)
                CreateDWordField (RSRC, 0x01D7, DELN)
                Store (One, DERW)
                Store (0x2000, DELN)
                If (And (DE_0, 0x1818))
                {
                    Store (Zero, DELN)
                }

                CreateBitField (RSRC, 0x0F08, E0RW)
                CreateDWordField (RSRC, 0x01F2, E0LN)
                Store (One, E0RW)
                Store (0x2000, E0LN)
                If (And (E0_0, 0x1818))
                {
                    Store (Zero, E0LN)
                }

                CreateBitField (RSRC, 0x0FE0, E2RW)
                CreateDWordField (RSRC, 0x020D, E2LN)
                Store (One, E2RW)
                Store (0x2000, E2LN)
                If (And (E2_0, 0x1818))
                {
                    Store (Zero, E2LN)
                }

                CreateBitField (RSRC, 0x10B8, E4RW)
                CreateDWordField (RSRC, 0x0228, E4LN)
                Store (One, E4RW)
                Store (0x2000, E4LN)
                If (And (E4_0, 0x1818))
                {
                    Store (Zero, E4LN)
                }

                CreateBitField (RSRC, 0x1190, E6RW)
                CreateDWordField (RSRC, 0x0243, E6LN)
                Store (One, E6RW)
                Store (0x2000, E6LN)
                If (And (E6_0, 0x1818))
                {
                    Store (Zero, E6LN)
                }

                CreateBitField (RSRC, 0x1268, E8RW)
                CreateDWordField (RSRC, 0x025E, E8LN)
                Store (One, E8RW)
                Store (0x2000, E8LN)
                If (And (E8_0, 0x1818))
                {
                    Store (Zero, E8LN)
                }

                CreateBitField (RSRC, 0x1340, EARW)
                CreateDWordField (RSRC, 0x0279, EALN)
                Store (One, EARW)
                Store (0x2000, EALN)
                If (And (EA_0, 0x1818))
                {
                    Store (Zero, EALN)
                }

                CreateBitField (RSRC, 0x1418, ECRW)
                CreateDWordField (RSRC, 0x0294, ECLN)
                Store (One, ECRW)
                Store (0x2000, ECLN)
                If (And (EC_0, 0x1818))
                {
                    Store (Zero, ECLN)
                }

                CreateBitField (RSRC, 0x14F0, EERW)
                CreateDWordField (RSRC, 0x02AF, EELN)
                Store (One, EERW)
                Store (0x2000, EELN)
                If (And (EE_0, 0x1818))
                {
                    Store (Zero, EELN)
                }

                CreateDWordField (RSRC, 0x02BE, BTMN)
                CreateDWordField (RSRC, 0x02CA, BTLN)
                Store (TOML, BTMN)
                Add (Not (BTMN), One, BTLN)
                Return (RSRC)
            }

            Device (AGP0)
            {
                Name (_ADR, 0x00010000)
            }

            Device (AMD3)
            {
                Name (_ADR, 0x00180003)
                OperationRegion (K8F3, PCI_Config, 0xE0, 0x10)
                Field (K8F3, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x05), 
                    Z002,   6
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (Z002, TOFF)
                }
            }

            Device (LAN)
            {
                Name (_ADR, 0x00040000)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x05
                })
                Name (LANP, Zero)
                Method (_PSW, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, LANP)
                    }
                    Else
                    {
                        Store (One, LANP)
                    }
                }
            }

            Device (MODM)
            {
                Name (_ADR, 0x00020006)
                Name (_PRW, Package (0x02)
                {
                    0x08, 
                    0x03
                })
            }

            Device (USB0)
            {
                Name (_ADR, 0x00030000)
                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
            }

            Device (USB1)
            {
                Name (_ADR, 0x00030001)
                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x00030002)
                Name (_PRW, Package (0x02)
                {
                    0x07, 
                    0x03
                })
            }

            Device (USB3)
            {
                Name (_ADR, 0x00030003)
                Name (_PRW, Package (0x02)
                {
                    0x06, 
                    0x03
                })
            }

            Device (IDEC)
            {
                Name (_ADR, 0x00020005)
                Name (IO5T, Package (0x03)
                {
                    Package (0x07)
                    {
                        0x78, 
                        0xB4, 
                        0x014A, 
                        0x0186, 
                        0x0258, 
                        0x78, 
                        0x96
                    }, 

                    Package (0x07)
                    {
                        0x06, 
                        0x07, 
                        0x1C, 
                        0x1C, 
                        0x1C, 
                        0x06, 
                        0x07
                    }, 

                    Package (0x07)
                    {
                        0x04, 
                        0x09, 
                        0x03, 
                        0x09, 
                        0x1E, 
                        0x04, 
                        0x06
                    }
                })
                Name (IO6T, Package (0x03)
                {
                    Package (0x07)
                    {
                        0x78, 
                        0xB4, 
                        0x014A, 
                        0x0186, 
                        0x0258, 
                        0x78, 
                        0xB4
                    }, 

                    Package (0x07)
                    {
                        0x09, 
                        0x0A, 
                        0x26, 
                        0x26, 
                        0x26, 
                        0x09, 
                        0x0A
                    }, 

                    Package (0x07)
                    {
                        0x05, 
                        0x0C, 
                        0x04, 
                        0x0C, 
                        0x28, 
                        0x05, 
                        0x0C
                    }
                })
                Name (UM5T, Package (0x06)
                {
                    0x0B, 
                    0x07, 
                    0x05, 
                    0x04, 
                    0x02, 
                    One
                })
                Name (UM6T, Package (0x07)
                {
                    0x0F, 
                    0x0A, 
                    0x07, 
                    0x05, 
                    0x03, 
                    0x02, 
                    One
                })
                Name (PIO5, Package (0x05)
                {
                    0x3A, 
                    0x25, 
                    0x1F, 
                    0x10, 
                    0x0A
                })
                Name (PIO6, Package (0x05)
                {
                    0x4E, 
                    0x32, 
                    0x2A, 
                    0x16, 
                    0x0E
                })
                Name (CRCT, Package (0x07)
                {
                    0x06, 
                    0x04, 
                    0x03, 
                    One, 
                    One, 
                    One, 
                    One
                })
                Name (INTT, Package (0x05)
                {
                    0x02, 
                    0x02, 
                    0x02, 
                    0x04, 
                    0x06
                })
                Name (DMAT, Package (0x05)
                {
                    Zero, 
                    One, 
                    One, 
                    One, 
                    0x02
                })
                Name (RMFL, One)
                OperationRegion (CF40, PCI_Config, 0x40, 0x18)
                Field (CF40, WordAcc, NoLock, Preserve)
                {
                        ,   1, 
                    IOR0,   1, 
                    UDM0,   1, 
                    UM60,   1, 
                    UCT0,   4, 
                    CRC0,   4, 
                    INI0,   4, 
                    ATT0,   6, 
                    Offset (0x03), 
                    RCT0,   6, 
                    Offset (0x04), 
                        ,   1, 
                    IOR1,   1, 
                    UDM1,   1, 
                    UM61,   1, 
                    UCT1,   4, 
                    CRC1,   4, 
                    INI1,   4, 
                    ATT1,   6, 
                    Offset (0x07), 
                    RCT1,   6, 
                    Offset (0x08), 
                        ,   1, 
                    IOR2,   1, 
                    UDM2,   1, 
                    UM62,   1, 
                    UCT2,   4, 
                    CRC2,   4, 
                    INI2,   4, 
                    ATT2,   6, 
                    Offset (0x0B), 
                    RCT2,   6, 
                    Offset (0x0C), 
                        ,   1, 
                    IOR3,   1, 
                    UDM3,   1, 
                    UM63,   1, 
                    UCT3,   4, 
                    CRC3,   4, 
                    INI3,   4, 
                    ATT3,   6, 
                    Offset (0x0F), 
                    RCT3,   6, 
                    Offset (0x10), 
                        ,   1, 
                    CHE0,   1, 
                    Offset (0x12), 
                        ,   1, 
                    CHE1,   1, 
                    Offset (0x14), 
                        ,   30, 
                    REMP,   1, 
                    Offset (0x18)
                }

                Name (IDEP, Buffer (0x14) {})
                CreateDWordField (IDEP, Zero, GTM0)
                CreateDWordField (IDEP, 0x04, GTM1)
                CreateDWordField (IDEP, 0x08, GTM2)
                CreateDWordField (IDEP, 0x0C, GTM3)
                CreateDWordField (IDEP, 0x10, GTM4)
                Device (IDE0)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (Buffer (0x14)
                        {
                            0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            0x1F, 0x00, 0x00, 0x00
                        })
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, IDEP)
                        Store (GTM0, Local0)
                        Store (GTM1, Local1)
                        Store (GTM2, Local2)
                        Store (GTM3, Local3)
                        Store (GTM4, Local4)
                        Store (REMP, RMFL)
                        Store (Zero, REMP)
                        If (LAnd (LNot (LEqual (Local1, Ones)), LNot (LEqual (Local1, Zero))))
                        {
                            If (And (Local4, One))
                            {
                                Store (One, UDM0)
                                If (LLess (Local1, 0x14))
                                {
                                    Store (One, UM60)
                                    Store (One, UCT0)
                                }
                                Else
                                {
                                    Store (Zero, UM60)
                                    Divide (Local1, 0x0A, Local6, Local5)
                                    Decrement (Local5)
                                    Store (Local5, UCT0)
                                    Store (Match (UM5T, MEQ, Local5, MTR, Zero, Zero), Local5)
                                    Store (DerefOf (Index (CRCT, Local5)), CRC0)
                                }
                            }
                        }

                        If (LAnd (LNot (LEqual (Local0, Ones)), LNot (LEqual (Local0, Zero))))
                        {
                            If (UM60)
                            {
                                Store (Match (DerefOf (Index (IO6T, Zero)), MEQ, Local0, MTR, Zero, Zero), Local6)
                                Store (DerefOf (Index (DerefOf (Index (IO6T, One)), Local6)), ATT0)
                                Store (DerefOf (Index (DerefOf (Index (IO6T, 0x02)), Local6)), RCT0)
                            }
                            Else
                            {
                                Store (Match (DerefOf (Index (IO5T, Zero)), MEQ, Local0, MTR, Zero, Zero), Local6)
                                Store (DerefOf (Index (DerefOf (Index (IO5T, One)), Local6)), ATT0)
                                Store (DerefOf (Index (DerefOf (Index (IO5T, 0x02)), Local6)), RCT0)
                                Store (DerefOf (Index (INTT, Local6)), INI0)
                            }
                        }

                        If (LAnd (LNot (LEqual (Local3, Ones)), LNot (LEqual (Local3, Zero))))
                        {
                            If (And (Local4, 0x04))
                            {
                                Store (One, UDM1)
                                If (LLess (Local3, 0x14))
                                {
                                    Store (One, UM61)
                                    Store (One, UCT1)
                                }
                                Else
                                {
                                    Store (Zero, UM61)
                                    Divide (Local3, 0x0A, Local6, Local5)
                                    Decrement (Local5)
                                    Store (Local5, UCT1)
                                    Store (Match (UM5T, MEQ, Local5, MTR, Zero, Zero), Local5)
                                    Store (DerefOf (Index (CRCT, Local5)), CRC1)
                                }
                            }
                        }

                        If (LAnd (LNot (LEqual (Local2, Ones)), LNot (LEqual (Local2, Zero))))
                        {
                            If (UM61)
                            {
                                Store (Match (DerefOf (Index (IO6T, Zero)), MEQ, Local2, MTR, Zero, Zero), Local6)
                                Store (DerefOf (Index (DerefOf (Index (IO6T, One)), Local6)), ATT1)
                                Store (DerefOf (Index (DerefOf (Index (IO6T, 0x02)), Local6)), RCT1)
                            }
                            Else
                            {
                                Store (Match (DerefOf (Index (IO5T, Zero)), MEQ, Local2, MTR, Zero, Zero), Local6)
                                Store (DerefOf (Index (DerefOf (Index (IO5T, One)), Local6)), ATT1)
                                Store (DerefOf (Index (DerefOf (Index (IO5T, 0x02)), Local6)), RCT1)
                                Store (DerefOf (Index (INTT, Local6)), INI1)
                            }
                        }

                        Store (RMFL, REMP)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local6)
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local7)
                            CreateByteField (Local6, One, MODE)
                            CreateByteField (Local7, One, UMOD)
                            Store (REMP, RMFL)
                            Store (Zero, REMP)
                            If (LNot (LEqual (ATT0, Zero)))
                            {
                                Add (ATT0, RCT0, Local5)
                                If (UM60)
                                {
                                    Store (Match (PIO6, MEQ, Local5, MTR, Zero, Zero), MODE)
                                }
                                Else
                                {
                                    Store (Match (PIO5, MEQ, Local5, MTR, Zero, Zero), MODE)
                                }

                                If (UDM0)
                                {
                                    If (UM60)
                                    {
                                        Store (Match (UM6T, MEQ, UCT0, MTR, Zero, Zero), UMOD)
                                    }
                                    Else
                                    {
                                        Store (Match (UM5T, MEQ, UCT0, MTR, Zero, Zero), UMOD)
                                    }

                                    Or (UMOD, 0x40, UMOD)
                                }
                                Else
                                {
                                    Store (DerefOf (Index (DMAT, MODE)), UMOD)
                                    Or (UMOD, 0x20, UMOD)
                                }

                                Or (MODE, 0x08, MODE)
                            }

                            Store (RMFL, REMP)
                            Concatenate (Local6, Local7, Local5)
                            Return (Local5)
                        }
                    }
                }

                Device (IDE1)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (Buffer (0x14)
                        {
                            0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            0x78, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 
                            0x1F, 0x00, 0x00, 0x00
                        })
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, IDEP)
                        Store (GTM0, Local0)
                        Store (GTM1, Local1)
                        Store (GTM2, Local2)
                        Store (GTM3, Local3)
                        Store (GTM4, Local4)
                        Store (REMP, RMFL)
                        Store (Zero, REMP)
                        If (LAnd (LNot (LEqual (Local1, Ones)), LNot (LEqual (Local1, Zero))))
                        {
                            If (And (Local4, One))
                            {
                                Store (One, UDM2)
                                If (LLess (Local1, 0x14))
                                {
                                    Store (One, UM62)
                                    Store (One, UCT2)
                                }
                                Else
                                {
                                    Store (Zero, UM62)
                                    Divide (Local1, 0x0A, Local6, Local5)
                                    Decrement (Local5)
                                    Store (Local5, UCT2)
                                    Store (Match (UM5T, MEQ, Local5, MTR, Zero, Zero), Local5)
                                    Store (DerefOf (Index (CRCT, Local5)), CRC2)
                                }
                            }
                        }

                        If (LAnd (LNot (LEqual (Local0, Ones)), LNot (LEqual (Local0, Zero))))
                        {
                            If (UM62)
                            {
                                Store (Match (DerefOf (Index (IO6T, Zero)), MEQ, Local0, MTR, Zero, Zero), Local6)
                                Store (DerefOf (Index (DerefOf (Index (IO6T, One)), Local6)), ATT2)
                                Store (DerefOf (Index (DerefOf (Index (IO6T, 0x02)), Local6)), RCT2)
                            }
                            Else
                            {
                                Store (Match (DerefOf (Index (IO5T, Zero)), MEQ, Local0, MTR, Zero, Zero), Local6)
                                Store (DerefOf (Index (DerefOf (Index (IO5T, One)), Local6)), ATT2)
                                Store (DerefOf (Index (DerefOf (Index (IO5T, 0x02)), Local6)), RCT2)
                                Store (DerefOf (Index (INTT, Local6)), INI2)
                            }
                        }

                        If (LAnd (LNot (LEqual (Local3, Ones)), LNot (LEqual (Local3, Zero))))
                        {
                            If (And (Local4, 0x04))
                            {
                                Store (One, UDM3)
                                If (LLess (Local3, 0x14))
                                {
                                    Store (One, UM63)
                                    Store (One, UCT3)
                                }
                                Else
                                {
                                    Store (Zero, UM63)
                                    Divide (Local3, 0x0A, Local6, Local5)
                                    Decrement (Local5)
                                    Store (Local5, UCT3)
                                    Store (Match (UM5T, MEQ, Local5, MTR, Zero, Zero), Local5)
                                    Store (DerefOf (Index (CRCT, Local5)), CRC3)
                                }
                            }
                        }

                        If (LAnd (LNot (LEqual (Local2, Ones)), LNot (LEqual (Local2, Zero))))
                        {
                            If (UM63)
                            {
                                Store (Match (DerefOf (Index (IO6T, Zero)), MEQ, Local2, MTR, Zero, Zero), Local6)
                                Store (DerefOf (Index (DerefOf (Index (IO6T, One)), Local6)), ATT3)
                                Store (DerefOf (Index (DerefOf (Index (IO6T, 0x02)), Local6)), RCT3)
                            }
                            Else
                            {
                                Store (Match (DerefOf (Index (IO5T, Zero)), MEQ, Local2, MTR, Zero, Zero), Local6)
                                Store (DerefOf (Index (DerefOf (Index (IO5T, One)), Local6)), ATT3)
                                Store (DerefOf (Index (DerefOf (Index (IO5T, 0x02)), Local6)), RCT3)
                                Store (DerefOf (Index (INTT, Local6)), INI3)
                            }
                        }

                        Store (RMFL, REMP)
                    }

                    Device (DRV0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local6)
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local7)
                            CreateByteField (Local6, One, MODE)
                            CreateByteField (Local7, One, UMOD)
                            Store (REMP, RMFL)
                            Store (Zero, REMP)
                            If (LNot (LEqual (ATT2, Zero)))
                            {
                                Add (ATT2, RCT2, Local5)
                                If (UM62)
                                {
                                    Store (Match (PIO6, MEQ, Local5, MTR, Zero, Zero), MODE)
                                }
                                Else
                                {
                                    Store (Match (PIO5, MEQ, Local5, MTR, Zero, Zero), MODE)
                                }

                                If (UDM2)
                                {
                                    If (UM62)
                                    {
                                        Store (Match (UM6T, MEQ, UCT2, MTR, Zero, Zero), UMOD)
                                    }
                                    Else
                                    {
                                        Store (Match (UM5T, MEQ, UCT2, MTR, Zero, Zero), UMOD)
                                    }

                                    Or (UMOD, 0x40, UMOD)
                                }
                                Else
                                {
                                    Store (DerefOf (Index (DMAT, MODE)), UMOD)
                                    Or (UMOD, 0x20, UMOD)
                                }

                                Or (MODE, 0x08, MODE)
                            }

                            Store (RMFL, REMP)
                            Concatenate (Local6, Local7, Local5)
                            Return (Local5)
                        }
                    }
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x00020000)
                OperationRegion (PCFG, PCI_Config, Zero, 0x80)
                Field (PCFG, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x41), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    Offset (0x60), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8, 
                    Offset (0x74), 
                    Z003,   16
                }

                OperationRegion (SOW, SystemIO, 0x8000, 0x90)
                Field (SOW, WordAcc, NoLock, Preserve)
                {
                    Offset (0x06), 
                    LGMS,   1, 
                    Offset (0x1A), 
                        ,   1, 
                    RLSL,   1, 
                    Offset (0x20), 
                        ,   2, 
                    SLP,    1, 
                    WK,     1, 
                    Offset (0x2B), 
                        ,   5, 
                    SSL,    1, 
                    SWK,    1, 
                    Z004,   1, 
                    Offset (0x62), 
                        ,   6, 
                    ALED,   2
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0000, 0x0000, 0x01, 0x10)
                        IO (Decode16, 0x0081, 0x0081, 0x01, 0x0F)
                        IO (Decode16, 0x00C0, 0x00C0, 0x01, 0x20)
                        IO (Decode16, 0x0480, 0x0480, 0x01, 0x10)
                        DMA (Compatibility, NotBusMaster, Transfer16) {4}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0020, 0x0020, 0x01, 0x02)
                        IO (Decode16, 0x00A0, 0x00A0, 0x01, 0x02)
                        IRQ (Edge, ActiveHigh, Exclusive) {2}
                    })
                }

                Device (TIME)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0040, 0x0040, 0x01, 0x04)
                        IRQNoFlags () {0}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0070, 0x0070, 0x01, 0x02)
                        IRQNoFlags () {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0061, 0x0061, 0x01, 0x01)
                    })
                }

                OperationRegion (SMCF, PCI_Config, 0x4C, One)
                Field (SMCF, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    IGUI,   1, 
                    SMAS,   3
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (RSRC, ResourceTemplate ()
                    {
                        IO (Decode16, 0x8000, 0x8000, 0x01, 0x80)
                        IO (Decode16, 0x8080, 0x8080, 0x01, 0x80)
                        IO (Decode16, 0x8100, 0x8100, 0x01, 0x20)
                        IO (Decode16, 0x0080, 0x0080, 0x01, 0x01)
                        IO (Decode16, 0x04D0, 0x04D0, 0x01, 0x02)
                        IO (Decode16, 0x002E, 0x002E, 0x01, 0x01)
                        IO (Decode16, 0x002F, 0x002F, 0x01, 0x01)
                        IO (Decode16, 0x0068, 0x006F, 0x01, 0x08)
                        IO (Decode16, 0x0092, 0x0092, 0x01, 0x01)
                        IO (Decode16, 0x03F0, 0x03F0, 0x01, 0x02)
                        Memory32Fixed (ReadOnly, 0xFEC00000, 0x00100000)
                        Memory32Fixed (ReadOnly, 0xFED00000, 0x00000400)
                        Memory32Fixed (ReadOnly, 0xFEE00000, 0x00100000)
                        Memory32Fixed (ReadOnly, 0xFFC00000, 0x00001000)
                        Memory32Fixed (ReadOnly, 0xFFE00000, 0x00001000)
                        Memory32Fixed (ReadOnly, 0xFFE80000, 0x00080000)
                        Memory32Fixed (ReadOnly, 0xFFFE0000, 0x00010000)
                        Memory32Fixed (ReadOnly, 0xFFFF0000, 0x00010000)
                        Memory32Fixed (ReadWrite, 0x00000000, 0x00000000)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (RSRC, 0xB4, SMBA)
                        CreateDWordField (RSRC, 0xB8, SMSZ)
                        Store (Zero, SMSZ)
                        If (IGUI)
                        {
                            If (SMAS)
                            {
                                Store (ShiftLeft (0x00800000, SMAS), SMSZ)
                                Subtract (TOML, SMSZ, SMBA)
                            }
                        }

                        Return (RSRC)
                    }
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0B)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x00F0, 0x00F0, 0x01, 0x10)
                        IRQNoFlags () {13}
                    })
                }

                Device (KBC)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_UID, One)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0060, 0x0060, 0x01, 0x01)
                        IO (Decode16, 0x0064, 0x0064, 0x01, 0x01)
                        IRQNoFlags () {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("SYN1003"))
                    Name (_CID, Package (0x03)
                    {
                        0x02102E4F, 
                        0x00102E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive) {12}
                    })
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0062, 0x0062, 0x01, 0x01)
                        IO (Decode16, 0x0066, 0x0066, 0x01, 0x01)
                    })
                    Name (_GPE, 0x19)
                    Name (SEL0, 0xF0)
                    Name (BFLG, Zero)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Local0)
                            If (Local0)
                            {
                                Store (One, ECOK)
                            }
                            Else
                            {
                                Store (Zero, ECOK)
                            }
                        }

                        If (ECOK)
                        {
                            Acquire (MUT1, 0xFFFF)
                            Store (0x03, RG59)
                            Store (BTEN, BLTH)
                            Store (^^^^WLAN, WLAN)
                            Store (One, CPLE)
                            Release (MUT1)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
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
                        S5LW,   1, 
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
                        LIDE,   1, 
                        BAYE,   1, 
                        PRDE,   1, 
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
                        LIDS,   1, 
                        BAYI,   1, 
                        PRCT,   1, 
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
                        Offset (0x53), 
                        DOFF,   8, 
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
                            ,   2, 
                        LION,   1, 
                        Offset (0x77), 
                        BA1C,   8, 
                        Offset (0x81), 
                        ABTS,   1, 
                        ABFC,   1, 
                            ,   3, 
                        ABBL,   1, 
                        Z005,   1, 
                        ABCT,   1, 
                        ABCG,   1, 
                            ,   2, 
                        ABTP,   1, 
                        Offset (0x87), 
                        BA2C,   8, 
                        Offset (0x8A), 
                        ACUR,   16, 
                        Offset (0xC1), 
                        MCUR,   16, 
                        MBRM,   16, 
                        MBVG,   16, 
                        BTST,   8, 
                        ABCR,   16, 
                        ABRM,   16, 
                        ABVG,   16, 
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
                        AFCC,   16, 
                        ABSN,   16, 
                        ABDC,   16, 
                        ABDV,   16, 
                        ABMN,   8, 
                        ABMD,   8, 
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

                    Mutex (MUT1, 0x00)
                    Mutex (MUT0, 0x00)
                    Method (SMRD, 4, NotSerialized)
                    {
                        If (LEqual (ECOK, Zero))
                        {
                            Return (0xFF)
                        }

                        If (LNot (LEqual (Arg0, 0x07)))
                        {
                            If (LNot (LEqual (Arg0, 0x09)))
                            {
                                If (LNot (LEqual (Arg0, 0x0B)))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, One))
                        {
                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            Store (Zero, Local3)
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
                                    Store (Zero, Local3)
                                }
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (Zero, Local0)
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

                                PBFE (Local4, Local5, Zero)
                                Store (Local4, Arg3)
                            }
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (SMWR, 4, NotSerialized)
                    {
                        If (LEqual (ECOK, Zero))
                        {
                            Return (0xFF)
                        }

                        If (LNot (LEqual (Arg0, 0x06)))
                        {
                            If (LNot (LEqual (Arg0, 0x08)))
                            {
                                If (LNot (LEqual (Arg0, 0x0A)))
                                {
                                    Return (0x19)
                                }
                            }
                        }

                        Acquire (MUT0, 0xFFFF)
                        Store (0x04, Local0)
                        While (LGreater (Local0, One))
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
                            Store (Zero, Local3)
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
                                    Store (Zero, Local3)
                                }
                            }

                            If (LEqual (Local1, 0x80))
                            {
                                Store (Zero, Local0)
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
                        Store (One, EBPL)
                    }

                    Name (PSTA, Zero)
                    Method (CPOL, 1, NotSerialized)
                    {
                        If (LEqual (PSTA, Zero))
                        {
                            If (LNot (LEqual (ECOK, Zero)))
                            {
                                APOL (Arg0)
                                Store (One, PSTA)
                            }
                        }
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        If (ECOK)
                        {
                            Acquire (MUT1, 0xFFFF)
                            If (And (SMST, 0x40))
                            {
                                Store (SMAA, Local0)
                                If (LEqual (Local0, 0x14))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (PWRE, Local1)
                                    If (Local1)
                                    {
                                        Store (Zero, PWRE)
                                        Store (0x12, BFLG)
                                        CPOL (One)
                                    }
                                }

                                If (LEqual (Local0, 0x16))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (0x04, ^^^^BAT1.BCRI)
                                    Notify (BAT1, 0x80)
                                }
                                Else
                                {
                                    Store (Zero, ^^^^BAT1.BCRI)
                                }
                            }

                            Release (MUT1)
                        }
                    }

                    Method (_Q09, 0, NotSerialized)
                    {
                        If (ECOK)
                        {
                            Store (Zero, PSTA)
                            ^^^^BAT1.Z006 ()
                            Notify (ACAD, 0x80)
                            Sleep (0x01F4)
                            Notify (BAT1, 0x80)
                            If (^^^^BAT1.BTCH)
                            {
                                ^^^^BAT1.UBIF ()
                                Notify (BAT1, 0x81)
                                Store (Zero, ^^^^BAT1.BTCH)
                            }
                        }
                    }

                    Method (_Q8A, 0, NotSerialized)
                    {
                        Store (0x8A, P80H)
                        If (LIDE)
                        {
                            Store (One, LIDE)
                            Notify (LID, 0x80)
                        }
                    }

                    Method (_Q8D, 0, NotSerialized)
                    {
                        Store (0x8D, P80H)
                        If (ECOK)
                        {
                            Acquire (MUT1, 0xFFFF)
                            Store (ACDF, ^^^^ACAD.ACST)
                            Release (MUT1)
                        }
                        Else
                        {
                            Store (One, ^^^^ACAD.ACST)
                        }

                        If (^^^^ACAD.ACST)
                        {
                            If (LNot (LEqual (\_PR.CPU0._PPC, Zero)))
                            {
                                Store (Zero, \_PR.CPU0._PPC)
                                Notify (\_PR.CPU0, 0x80)
                                Sleep (0x01F4)
                            }
                        }
                        Else
                        {
                            Store (PNUM, Local1)
                            If (LLess (\_PR.CPU0._PPC, Local1))
                            {
                                Store (Local1, \_PR.CPU0._PPC)
                                Notify (\_PR.CPU0, 0x80)
                                Sleep (0x01F4)
                            }
                        }
                    }

                    Method (_Q8E, 0, NotSerialized)
                    {
                        Store (0x8E, P80H)
                        If (LNot (LEqual (\_PR.CPU0._PPC, Zero)))
                        {
                            Store (Zero, \_PR.CPU0._PPC)
                            Notify (\_PR.CPU0, 0x80)
                            Sleep (0x01F4)
                        }
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Notify (SLPB, 0x80)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                    }
                }
            }

            Device (LNKA)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, One)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {3,4,5,7,9,10,11}
                })
                Method (_DIS, 0, NotSerialized)
                {
                    Or (^^LPCB.PIRA, 0x80, ^^LPCB.PIRA)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    CreateWordField (RSRC, One, IRQ0)
                    If (LEqual (And (^^LPCB.PIRA, 0x80), Zero))
                    {
                        And (^^LPCB.PIRA, 0x0F, Local0)
                        ShiftLeft (One, Local0, IRQ0)
                    }

                    Return (RSRC)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ0)
                    FindSetRightBit (IRQ0, Local0)
                    Decrement (Local0)
                    Or (Local0, And (^^LPCB.PIRA, 0x70), ^^LPCB.PIRA)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (And (^^LPCB.PIRA, 0x80))
                    {
                        Return (0x09)
                    }

                    Return (0x0B)
                }
            }

            Device (LNKB)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x02)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {3,4,5,7,9,10,11}
                })
                Name (RSRC, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {}
                })
                Method (_DIS, 0, NotSerialized)
                {
                    Or (^^LPCB.PIRB, 0x80, ^^LPCB.PIRB)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (RSRC, One, IRQ0)
                    And (^^LPCB.PIRB, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQ0)
                    Return (RSRC)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ0)
                    FindSetRightBit (IRQ0, Local0)
                    Decrement (Local0)
                    Or (Local0, And (^^LPCB.PIRB, 0x70), ^^LPCB.PIRB)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (And (^^LPCB.PIRB, 0x80))
                    {
                        Return (0x09)
                    }

                    Return (0x0B)
                }
            }

            Device (LNKC)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x03)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {3,4,5,7,9,10,11}
                })
                Name (RSRC, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {}
                })
                Method (_DIS, 0, NotSerialized)
                {
                    Or (^^LPCB.PIRC, 0x80, ^^LPCB.PIRC)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (RSRC, One, IRQ0)
                    And (^^LPCB.PIRC, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQ0)
                    Return (RSRC)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ0)
                    FindSetRightBit (IRQ0, Local0)
                    Decrement (Local0)
                    Or (Local0, And (^^LPCB.PIRC, 0x70), ^^LPCB.PIRC)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (And (^^LPCB.PIRC, 0x80))
                    {
                        Return (0x09)
                    }

                    Return (0x0B)
                }
            }

            Device (LNKD)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x04)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {3,4,5,7,9,10,11}
                })
                Name (RSRC, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {}
                })
                Method (_DIS, 0, NotSerialized)
                {
                    Or (^^LPCB.PIRD, 0x80, ^^LPCB.PIRD)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (RSRC, One, IRQ0)
                    And (^^LPCB.PIRD, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQ0)
                    Return (RSRC)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ0)
                    FindSetRightBit (IRQ0, Local0)
                    Decrement (Local0)
                    Or (Local0, And (^^LPCB.PIRD, 0x70), ^^LPCB.PIRD)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (And (^^LPCB.PIRD, 0x80))
                    {
                        Return (0x09)
                    }

                    Return (0x0B)
                }
            }

            Device (LNKE)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x05)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {3,4,5,7,9,10,11}
                })
                Method (_DIS, 0, NotSerialized)
                {
                    Or (^^LPCB.PIRE, 0x80, ^^LPCB.PIRE)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (RSRC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared) {}
                    })
                    CreateWordField (RSRC, One, IRQ0)
                    If (LEqual (And (^^LPCB.PIRE, 0x80), Zero))
                    {
                        And (^^LPCB.PIRE, 0x0F, Local0)
                        ShiftLeft (One, Local0, IRQ0)
                    }

                    Return (RSRC)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ0)
                    FindSetRightBit (IRQ0, Local0)
                    Decrement (Local0)
                    Or (Local0, And (^^LPCB.PIRE, 0x70), ^^LPCB.PIRE)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (And (^^LPCB.PIRE, 0x80))
                    {
                        Return (0x09)
                    }

                    Return (0x0B)
                }
            }

            Device (LNKF)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x06)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {3,4,5,7,9,10,11}
                })
                Name (RSRC, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {}
                })
                Method (_DIS, 0, NotSerialized)
                {
                    Or (^^LPCB.PIRF, 0x80, ^^LPCB.PIRF)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (RSRC, One, IRQ0)
                    And (^^LPCB.PIRF, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQ0)
                    Return (RSRC)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ0)
                    FindSetRightBit (IRQ0, Local0)
                    Decrement (Local0)
                    Or (Local0, And (^^LPCB.PIRF, 0x70), ^^LPCB.PIRF)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (And (^^LPCB.PIRF, 0x80))
                    {
                        Return (0x09)
                    }

                    Return (0x0B)
                }
            }

            Device (LNKG)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x07)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {3,4,5,7,9,10,11}
                })
                Name (RSRC, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {}
                })
                Method (_DIS, 0, NotSerialized)
                {
                    Or (^^LPCB.PIRG, 0x80, ^^LPCB.PIRG)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (RSRC, One, IRQ0)
                    And (^^LPCB.PIRG, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQ0)
                    Return (RSRC)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ0)
                    FindSetRightBit (IRQ0, Local0)
                    Decrement (Local0)
                    Or (Local0, And (^^LPCB.PIRG, 0x70), ^^LPCB.PIRG)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (And (^^LPCB.PIRG, 0x80))
                    {
                        Return (0x09)
                    }

                    Return (0x0B)
                }
            }

            Device (LNKH)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x08)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {3,4,5,7,9,10,11}
                })
                Name (RSRC, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared) {}
                })
                Method (_DIS, 0, NotSerialized)
                {
                    Or (^^LPCB.PIRH, 0x80, ^^LPCB.PIRH)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (RSRC, One, IRQ0)
                    And (^^LPCB.PIRH, 0x0F, Local0)
                    ShiftLeft (One, Local0, IRQ0)
                    Return (RSRC)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQ0)
                    FindSetRightBit (IRQ0, Local0)
                    Decrement (Local0)
                    Or (Local0, And (^^LPCB.PIRH, 0x70), ^^LPCB.PIRH)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (And (^^LPCB.PIRH, 0x80))
                    {
                        Return (0x09)
                    }

                    Return (0x0B)
                }
            }
        }

        OperationRegion (SMI0, SystemIO, 0xFE00, 0x02)
        Field (SMI0, AnyAcc, NoLock, Preserve)
        {
            SMIC,   8
        }

        OperationRegion (SMI1, SystemMemory, 0x0BEFADE5, 0x0120)
        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
            BCMD,   8, 
            DID,    32, 
            INF,    8
        }

        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
            Offset (0x110), 
            BTEN,   1, 
            WLAN,   1, 
            DOCK,   1, 
            Offset (0x111), 
            PNUM,   8
        }

        Mutex (PSMX, 0x00)
        Method (PHSR, 2, NotSerialized)
        {
            Acquire (PSMX, 0xFFFF)
            Store (0x90, BCMD)
            Store (Arg0, DID)
            Store (Arg1, INF)
            Store (Zero, SMIC)
            Store (INF, Local0)
            Release (PSMX)
            Return (Local0)
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (ACST, Zero)
            Method (_PSR, 0, NotSerialized)
            {
                If (ECOK)
                {
                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (^^PCI0.LPCB.EC0.ACDF, ACST)
                    Release (^^PCI0.LPCB.EC0.MUT1)
                }
                Else
                {
                    Store (One, ACST)
                }

                If (ACST)
                {
                    Store (One, Local0)
                    Store (Zero, ^^BAT1.BCRI)
                }
                Else
                {
                    Store (Zero, Local0)
                }

                Return (Local0)
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, One)
            Name (CBTI, Zero)
            Name (PBTI, Zero)
            Name (BTIN, Zero)
            Name (BTCH, Zero)
            Name (BIFI, Zero)
            Name (SEL0, Zero)
            Name (BCRI, Zero)
            Name (PBIF, Package (0x0D)
            {
                One, 
                0x1130, 
                0x1130, 
                One, 
                0x2B5C, 
                0xC8, 
                0x3C, 
                0x20, 
                0x20, 
                "BAT1      ", 
                "11        ", 
                "11        ", 
                "11        "
            })
            Name (PBST, Package (0x04)
            {
                Zero, 
                Ones, 
                Ones, 
                0x2710
            })
            Name (ERRC, Zero)
            Name (_PCL, Package (0x01)
            {
                _SB
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
                If (LEqual (BIFI, Zero))
                {
                    UBIF ()
                    Store (One, BIFI)
                }

                Return (PBIF)
            }

            Name (LFCC, 0x1130)
            Method (UBIF, 0, NotSerialized)
            {
                If (ECOK)
                {
                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (^^PCI0.LPCB.EC0.BTDC, Local0)
                    Store (^^PCI0.LPCB.EC0.LFCC, Local1)
                    Store (^^PCI0.LPCB.EC0.BTDV, Local2)
                    Store (^^PCI0.LPCB.EC0.BTMD, Local3)
                    Store (^^PCI0.LPCB.EC0.BTMN, Local4)
                    Store (^^PCI0.LPCB.EC0.BTSN, Local5)
                    Store (^^PCI0.LPCB.EC0.LION, Local6)
                    Release (^^PCI0.LPCB.EC0.MUT1)
                    Store (Local0, Index (PBIF, One))
                    Store (Local1, Index (PBIF, 0x02))
                    Store (Local2, Index (PBIF, 0x04))
                    Store (Local1, LFCC)
                    Multiply (Local1, 0x04, Local7)
                    Divide (Local7, 0x64, , Local7)
                    Store (Local7, Index (PBIF, 0x06))
                    If (Local6)
                    {
                        Store ("NiMH", Index (PBIF, 0x0B))
                    }
                    Else
                    {
                        Store ("LION", Index (PBIF, 0x0B))
                    }

                    And (Local3, 0x0F, Local3)
                    Store ("ZL06", Index (PBIF, 0x09))
                    If (LEqual (Local3, One))
                    {
                        Store ("01ZL", Index (PBIF, 0x09))
                    }
                    Else
                    {
                        If (LEqual (Local3, 0x02))
                        {
                            Store ("02ZL", Index (PBIF, 0x09))
                        }
                        Else
                        {
                            If (LEqual (Local3, 0x03))
                            {
                                Store ("03ZL", Index (PBIF, 0x09))
                            }
                            Else
                            {
                                If (LEqual (Local3, 0x04))
                                {
                                    Store ("04ZL", Index (PBIF, 0x09))
                                }
                                Else
                                {
                                    If (LEqual (Local3, 0x05))
                                    {
                                        Store ("05ZL", Index (PBIF, 0x09))
                                    }
                                    Else
                                    {
                                        If (LEqual (Local3, 0x06))
                                        {
                                            Store ("06ZL", Index (PBIF, 0x09))
                                        }
                                        Else
                                        {
                                            If (LEqual (Local3, 0x08))
                                            {
                                                Store ("08ZL", Index (PBIF, 0x09))
                                            }
                                            Else
                                            {
                                                If (LEqual (Local3, 0x09))
                                                {
                                                    Store ("09ZL", Index (PBIF, 0x09))
                                                }
                                                Else
                                                {
                                                    If (LEqual (Local3, 0x0A))
                                                    {
                                                        Store ("10ZL", Index (PBIF, 0x09))
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (Local3, 0x0B))
                                                        {
                                                            Store ("11ZL", Index (PBIF, 0x09))
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (Local4, 0x0B))
                    {
                        Store ("SIMPLO", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x09))
                        {
                            Store ("PANASONIC", Index (PBIF, 0x0C))
                        }
                        Else
                        {
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
                        }
                    }

                    Store (ITOS (ToBCD (Local5)), Index (PBIF, 0x0A))
                }
            }

            Name (RCAP, Zero)
            Method (_BST, 0, NotSerialized)
            {
                If (LEqual (BTIN, Zero))
                {
                    Store (Zero, Index (PBST, Zero))
                    Store (Ones, Index (PBST, One))
                    Store (Ones, Index (PBST, 0x02))
                    Store (Ones, Index (PBST, 0x03))
                    Return (PBST)
                }

                If (ECOK)
                {
                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (^^PCI0.LPCB.EC0.MBTC, Local0)
                    Store (^^PCI0.LPCB.EC0.MBRM, Local1)
                    Store (^^PCI0.LPCB.EC0.MBVG, Local2)
                    Store (^^PCI0.LPCB.EC0.MCUR, Local3)
                    Store (^^PCI0.LPCB.EC0.BTST, Local4)
                    Store (^^PCI0.LPCB.EC0.MBTF, Local5)
                    Store (^^PCI0.LPCB.EC0.ACDF, Local6)
                    Release (^^PCI0.LPCB.EC0.MUT1)
                    If (Local6)
                    {
                        If (LEqual (Local5, One))
                        {
                            Store (Zero, Local7)
                            Store (LFCC, Local1)
                        }
                        Else
                        {
                            If (LEqual (Local0, One))
                            {
                                Store (0x02, Local7)
                            }
                            Else
                            {
                                Store (Zero, Local7)
                            }
                        }
                    }
                    Else
                    {
                        If (LAnd (Local4, One))
                        {
                            Store (One, Local7)
                        }
                        Else
                        {
                            Store (Zero, Local7)
                        }
                    }

                    And (Local4, 0x04, Local4)
                    If (LEqual (Local4, 0x04))
                    {
                        Or (Local7, Local4, Local7)
                    }

                    Store (Local7, Index (PBST, Zero))
                    If (LNot (And (Local1, 0x8000)))
                    {
                        Store (Local1, Index (PBST, 0x02))
                    }

                    If (LNot (And (Local2, 0x8000)))
                    {
                        Store (Local7, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNot (LEqual (Local3, 0xFFFF)))
                        {
                            Not (Local3, Local3)
                            Increment (Local3)
                            And (Local3, 0xFFFF, Local3)
                        }
                    }

                    Store (Local3, Index (PBST, One))
                }

                Return (PBST)
            }

            Method (Z006, 0, NotSerialized)
            {
                If (ECOK)
                {
                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (^^PCI0.LPCB.EC0.MBTS, Local0)
                    Release (^^PCI0.LPCB.EC0.MUT1)
                    If (LEqual (Local0, One))
                    {
                        If (LEqual (BTIN, Zero))
                        {
                            Store (One, BTCH)
                            Store (Zero, BIFI)
                        }

                        Store (One, BTIN)
                    }
                    Else
                    {
                        If (LEqual (BTIN, One))
                        {
                            Store (One, BTCH)
                            Store (Zero, BIFI)
                        }

                        Store (Zero, BTIN)
                    }
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Name (LSTS, Zero)
            Method (_LID, 0, NotSerialized)
            {
                If (ECOK)
                {
                    If (^^PCI0.LPCB.EC0.LIDS)
                    {
                        Store (Zero, LSTS)
                    }
                    Else
                    {
                        Store (One, LSTS)
                    }
                }
                Else
                {
                    Store (Zero, LSTS)
                }

                Return (LSTS)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Scope (\_TZ)
        {
            ThermalZone (THRM)
            {
                Method (_TMP, 0, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPCB.EC0.CTMP, Local0)
                        Release (\_SB.PCI0.LPCB.EC0.MUT1)
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
                    Return (0x0E4E)
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
                    Return (0x0E76)
                }
            }
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (Zero, \_SB.PCI0.LPCB.ALED)
        Store (\_SB.BTEN, \_SB.PCI0.LPCB.EC0.BLTH)
        Store (\_SB.WLAN, \_SB.PCI0.LPCB.EC0.WLAN)
        Store (One, \_SB.PCI0.LPCB.EC0.CPLE)
        If (LEqual (Arg0, 0x03))
        {
            \_SB.PHSR (Zero, Zero)
        }

        If (LEqual (Arg0, 0x04))
        {
            \_SB.PHSR (0x03, Zero)
        }

        If (\_SB.ECOK)
        {
            Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
            If (LEqual (\_SB.PCI0.LAN.LANP, Zero))
            {
                Store (Zero, \_SB.PCI0.LPCB.EC0.VAUX)
            }
            Else
            {
                Store (One, \_SB.PCI0.LPCB.EC0.VAUX)
            }

            Release (\_SB.PCI0.LPCB.EC0.MUT1)
        }

        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }

    Method (_PTS, 1, NotSerialized)
    {
        If (LNot (LGreater (Arg0, 0x03)))
        {
            Store (One, \_SB.PCI0.LPCB.ALED)
            \_SB.PHSR (One, Zero)
        }
        Else
        {
            Store (Zero, \_SB.PCI0.LPCB.ALED)
        }

        If (LEqual (Arg0, 0x04))
        {
            \_SB.PHSR (0x02, Zero)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (One, \_SB.PCI0.LPCB.EC0.PFLG)
            Store (One, \_SB.PCI0.LPCB.EC0.FLS4)
        }

        If (LNot (LLess (Arg0, 0x04)))
        {
            Store (Z001, Local0)
            Or (Local0, 0x40, Local0)
            Store (Local0, Z001)
        }
    }

    Scope (_GPE)
    {
        Method (_L08, 0, NotSerialized)
        {
            Notify (\_SB.PCI0, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0, 0x02)
        }
    }

    Name (FWSO, "FWSO")
}

