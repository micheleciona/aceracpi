/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of 4520, Wed Oct 31 12:26:04 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000065BD (26045)
 *     Revision         0x01
 *     OEM ID           "NVIDIA"
 *     OEM Table ID     "MCP67"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x03000000 (50331648)
 */
DefinitionBlock ("4520.aml", "DSDT", 1, "NVIDIA", "MCP67", 0x06040000)
{
    External (\_PR_.CPU1._PPC, IntObj)
    External (\_PR_.CPU0._PPC, IntObj)

    OperationRegion (PRT0, SystemIO, 0x80, 0x01)
    Field (PRT0, ByteAcc, Lock, Preserve)
    {
        P80H,   8
    }

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
    Name (INSX, 0x00)
    Name (SX, 0x00)
    Name (BRTN, 0x00)
    Name (BOWN, 0x00)
    Name (BRUD, 0x00)
    Method (\_PTS, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, INS4)
            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
            Store (0x01, \_SB.PCI0.LPC0.EC0.FLS4)
            Release (\_SB.PCI0.LPC0.EC0.MUT1)
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        Notify (\_SB.PWRB, 0x02)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x00, INS4)
        }

        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            Store (\_SB.PCI0.LPC0.BTEN, \_SB.PCI0.LPC0.EC0.BLTH)
            Store (\_SB.PCI0.LPC0.WLAN, \_SB.PCI0.LPC0.EC0.WLAN)
            Store (0x01, \_SB.PCI0.LPC0.EC0.CPLE)
            Notify (\_SB.PCI0.XVR1, 0x00)
        }
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06) {}
        Processor (CPU1, 0x01, 0x00000000, 0x00) {}
        Processor (CPU2, 0x02, 0x00000000, 0x00) {}
        Processor (CPU3, 0x03, 0x00000000, 0x00) {}
    }

    Scope (\_GPE)
    {
        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MAC0, 0x02)
            Notify (\_SB.PCI0.AZA0, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB0, 0x02)
        }

        Method (_L11, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.XVR0, 0x02)
            Notify (\_SB.PCI0.XVR1, 0x02)
        }

        Method (_L14, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.XVR1, 0x00)
        }

        Method (_L17, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.Z000, 0x02)
        }

        Method (_L18, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.Z001, 0x02)
        }
    }

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

    OperationRegion (NV1, SystemIO, 0x72, 0x02)
    Field (NV1, ByteAcc, NoLock, Preserve)
    {
        INDX,   8, 
        DATA,   8
    }

    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
    {
                Offset (0xEE), 
        INS4,   1, 
                Offset (0xF0), 
        DLST,   8
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)
        {
            Store ("==== SST Working ====", Debug)
        }

        Method (_MSG, 1, NotSerialized)
        {
        }
    }

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store (0x07D0, OSYS)
            If (CondRefOf (_OSI, Local0))
            {
                If (_OSI ("Windows 2001"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    Store (0x07D2, OSYS)
                }

                If (_OSI ("Windows 2006"))
                {
                    Store (0x07D6, OSYS)
                }
            }
        }

        Name (OSYS, 0x00)
        Name (ECOK, 0x00)
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (PCI0)
        {
            Name (_ADR, 0x00)
            Name (_HID, EisaId ("PNP0A03"))
            Name (_UID, 0x01)
            Method (_S3D, 0, NotSerialized)
            {
                Return (0x01)
            }

            Scope (\_SB)
            {
                OperationRegion (ASLD, SystemMemory, 0x7FEE5D2C, 0x00000100)
                Field (ASLD, AnyAcc, NoLock, Preserve)
                {
                    TOM,    32, 
                    R_ST,   1, 
                        ,   3, 
                    R_P0,   4, 
                    R_S0,   4, 
                    R_S1,   4, 
                    RSS0,   4, 
                    RSS1,   4
                }
            }

            Method (_CRS, 0, NotSerialized)
            {
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
                        0x000C0000,         // Range Minimum
                        0x000C3FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000C4000,         // Range Minimum
                        0x000C7FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000C8000,         // Range Minimum
                        0x000CBFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000CC000,         // Range Minimum
                        0x000CFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000D0000,         // Range Minimum
                        0x000D3FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000D4000,         // Range Minimum
                        0x000D7FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000D8000,         // Range Minimum
                        0x000DBFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000DC000,         // Range Minimum
                        0x000DFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000E0000,         // Range Minimum
                        0x000E3FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000E4000,         // Range Minimum
                        0x000E7FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000E8000,         // Range Minimum
                        0x000EBFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000EC000,         // Range Minimum
                        0x000EFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00004000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x000F0000,         // Range Minimum
                        0x000FFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00010000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0xFED40000,         // Range Minimum
                        0xFED44FFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x00005000,         // Length
                        0x00,, , AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x00100000,         // Range Minimum
                        0xFEBFFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0xFFF00000,         // Length
                        ,, _Y00, AddressRangeMemory, TypeStatic)
                })
                CreateDWordField (CBUF, \_SB.PCI0._CRS._Y00._MIN, PMMN)
                CreateDWordField (CBUF, \_SB.PCI0._CRS._Y00._LEN, PMLN)
                Multiply (\_SB.TOM, 0x00100000, PMMN)
                Subtract (0xFEC00000, PMMN, PMLN)
                Return (CBUF)
            }

            Name (_PRT, Package (0x0B)
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
                    \_SB.PCI0.LPMU, 
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
                    \_SB.PCI0.LUS2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x00, 
                    \_SB.PCI0.Z002, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x01, 
                    \_SB.PCI0.Z003, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    \_SB.PCI0.LMAC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x00, 
                    \_SB.PCI0.LAZA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    \_SB.PCI0.LPID, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x00, 
                    \_SB.PCI0.LSI0, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    0x00, 
                    \_SB.PCI0.LGPU, 
                    0x00
                }
            })
            Device (SMB0)
            {
                Name (_ADR, 0x00010001)
                OperationRegion (SMCF, PCI_Config, 0x48, 0x04)
                Field (SMCF, AnyAcc, NoLock, Preserve)
                {
                    SB48,   4
                }

                OperationRegion (SBA0, PCI_Config, 0x20, 0x04)
                Field (SBA0, AnyAcc, NoLock, Preserve)
                {
                    SB20,   16
                }

                OperationRegion (SBA1, PCI_Config, 0x24, 0x04)
                Field (SBA1, AnyAcc, NoLock, Preserve)
                {
                    SB24,   16
                }

                OperationRegion (SBA2, PCI_Config, 0x7C, 0x04)
                Field (SBA2, AnyAcc, NoLock, Preserve)
                {
                    SB7C,   16
                }

                OperationRegion (SM74, PCI_Config, 0x74, 0x04)
                Field (SM74, AnyAcc, NoLock, Preserve)
                {
                    SMUB,   32
                }

                OperationRegion (SM6C, PCI_Config, 0x6C, 0x04)
                Field (SM6C, AnyAcc, NoLock, Preserve)
                {
                    WDTA,   32
                }

                OperationRegion (SM80, PCI_Config, 0x80, 0x04)
                Field (SM80, AnyAcc, NoLock, Preserve)
                {
                    NVAM,   32
                }

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
            }

            Device (USB0)
            {
                Name (_ADR, 0x00020000)
                Method (_S1D, 0, NotSerialized)
                {
                    Return (0x01)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x00020001)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (Z001)
            {
                Name (_ADR, 0x00040000)
                Method (_S1D, 0, NotSerialized)
                {
                    Return (0x01)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x18, 
                    0x03
                })
            }

            Device (Z000)
            {
                Name (_ADR, 0x00040001)
                Name (_PRW, Package (0x02)
                {
                    0x17, 
                    0x03
                })
            }

            Device (MAC0)
            {
                Name (_ADR, 0x000A0000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x05
                })
            }

            Device (AZA0)
            {
                Name (_ADR, 0x00070000)
                Name (_PRW, Package (0x02)
                {
                    0x15, 
                    0x03
                })
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00120000)
                Name (DISW, 0x01)
                Method (_DOS, 1, NotSerialized)
                {
                    Store (Arg0, DISW)
                    Store (ShiftRight (And (DISW, 0x04), 0x02), Local0)
                    \_SB.PCI0.LPC0.PHSR (0x04, Local0)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x02)
                    {
                        0x0110, 
                        0x80000100
                    })
                }

                Device (CRT0)
                {
                    Name (_ADR, 0x0100)
                }

                Device (LCD0)
                {
                    Name (_ADR, 0x0110)
                    Method (_BCL, 0, NotSerialized)
                    {
                        Store (0x00, \BOWN)
                        Return (Package (0x0C)
                        {
                            0x50, 
                            0x32, 
                            0x0A, 
                            0x14, 
                            0x1E, 
                            0x28, 
                            0x32, 
                            0x3C, 
                            0x46, 
                            0x50, 
                            0x5A, 
                            0x64
                        })
                    }

                    Method (_BCM, 1, NotSerialized)
                    {
                        If (LEqual (\BOWN, 0x00))
                        {
                            Store (Subtract (Divide (Arg0, 0x0A, ), 0x01), Local0)
                            Store (Local0, BRTN)
                            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                            Store (Local0, \_SB.PCI0.LPC0.EC0.BLVL)
                            Release (\_SB.PCI0.LPC0.EC0.MUT1)
                            If (LLess (OSYS, 0x07D6))
                            {
                                If (LEqual (\_SB.WMID.BAEF, 0x01))
                                {
                                    Sleep (0xC8)
                                    Store (0x05, \_SB.WMID.WMIQ)
                                    Notify (\_SB.WMID, 0x80)
                                }
                            }
                        }
                        Else
                        {
                            Store (0x00, \BOWN)
                        }
                    }

                    Method (_BQC, 0, NotSerialized)
                    {
                        Store (BRTN, Local0)
                        Return (Multiply (Add (Local0, 0x01), 0x0A))
                    }
                }
            }

            Device (P2P0)
            {
                Name (_ADR, 0x00080000)
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

                Name (_PRT, Package (0x02)
                {
                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x01, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }
                })
            }

            Device (XVR0)
            {
                Name (_ADR, 0x000B0000)
                Name (_UID, 0x10)
                OperationRegion (A1E0, PCI_Config, 0x19, 0x01)
                Field (A1E0, ByteAcc, NoLock, Preserve)
                {
                    SECB,   8
                }

                OperationRegion (A1E1, PCI_Config, 0x93, 0x01)
                Field (A1E1, ByteAcc, NoLock, Preserve)
                {
                    CPPE,   8
                }

                Method (_BBN, 0, NotSerialized)
                {
                    Return (SECB)
                }

                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }
                })
                Device (Z004)
                {
                    Name (_ADR, 0x00)
                    Name (DISW, 0x01)
                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (Arg0, DISW)
                        Store (ShiftRight (And (DISW, 0x04), 0x02), Local0)
                        \_SB.PCI0.LPC0.PHSR (0x04, Local0)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x02)
                        {
                            0x0110, 
                            0x80020100
                        })
                    }

                    Device (CRT0)
                    {
                        Name (_ADR, 0x0100)
                    }

                    Device (LCD0)
                    {
                        Name (_ADR, 0x0110)
                        Method (_BCL, 0, NotSerialized)
                        {
                            Store (0x00, \BOWN)
                            Return (Package (0x0C)
                            {
                                0x50, 
                                0x32, 
                                0x0A, 
                                0x14, 
                                0x1E, 
                                0x28, 
                                0x32, 
                                0x3C, 
                                0x46, 
                                0x50, 
                                0x5A, 
                                0x64
                            })
                        }

                        Method (_BCM, 1, NotSerialized)
                        {
                            If (LEqual (\BOWN, 0x00))
                            {
                                Store (Subtract (Divide (Arg0, 0x0A, ), 0x01), Local0)
                                Store (Local0, BRTN)
                                Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                                Store (Local0, \_SB.PCI0.LPC0.EC0.BLVL)
                                Release (\_SB.PCI0.LPC0.EC0.MUT1)
                                If (LLess (OSYS, 0x07D6))
                                {
                                    If (LEqual (\_SB.WMID.BAEF, 0x01))
                                    {
                                        Sleep (0xC8)
                                        Store (0x05, \_SB.WMID.WMIQ)
                                        Notify (\_SB.WMID, 0x80)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x00, \BOWN)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            Store (BRTN, Local0)
                            Return (Multiply (Add (Local0, 0x01), 0x0A))
                        }
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
            }

            Device (XVR1)
            {
                Name (_ADR, 0x000C0000)
                Name (_UID, 0x11)
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

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }
                })
                Device (Z005)
                {
                    Name (_ADR, 0x00)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
            }

            Device (XVR2)
            {
                Name (_ADR, 0x000D0000)
                Name (_UID, 0x12)
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

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }
                })
                Device (Z006)
                {
                    Name (_ADR, 0x00)
                }
            }

            Device (XVR3)
            {
                Name (_ADR, 0x000E0000)
                Name (_UID, 0x13)
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

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }
                })
                Device (Z007)
                {
                    Name (_ADR, 0x00)
                }
            }

            Device (XVR4)
            {
                Name (_ADR, 0x000F0000)
                Name (_UID, 0x14)
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

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }
                })
                Device (Z008)
                {
                    Name (_ADR, 0x00)
                }
            }

            Device (XVR5)
            {
                Name (_ADR, 0x00100000)
                Name (_UID, 0x15)
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

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }
                })
                Device (Z009)
                {
                    Name (_ADR, 0x00)
                }
            }

            Device (XVR6)
            {
                Name (_ADR, 0x00110000)
                Name (_UID, 0x16)
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

                Name (_PRT, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x00, 
                        \_SB.PCI0.LK4E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x01, 
                        \_SB.PCI0.LK1E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        \_SB.PCI0.LK2E, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        \_SB.PCI0.LK3E, 
                        0x00
                    }
                })
                Device (Z00A)
                {
                    Name (_ADR, 0x00)
                }
            }

            Name (NATA, Package (0x01)
            {
                0x00060000
            })
            Scope (\_SB.PCI0)
            {
                Device (NVRB)
                {
                    Name (_HID, "NVRAIDBUS")
                    Name (FNVR, 0xFF)
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, FNVR)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.R_ST, 0x01))
                        {
                            If (LEqual (FNVR, 0xFF))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x04D2,             // Range Minimum
                            0x04D2,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        Store (0xFF, FNVR)
                    }
                }
            }

            Device (IDE0)
            {
                Name (SID4, 0x00)
                Name (SID5, 0x00)
                Name (SFLG, 0x00)
                Name (SID0, 0x00)
                Name (SID1, 0x00)
                Name (SID2, 0x00)
                Name (SID3, 0x00)
                Name (_ADR, 0x00060000)
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
                        Return (GTM (0x00))
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
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x00, 0xB0))
                        }
                    }
                }

                Method (DRMP, 0, NotSerialized)
                {
                    Return (\_SB.R_P0)
                }
            }

            Device (SAT0)
            {
                Name (_ADR, 0x00090000)
                Device (PRI0)
                {
                    Name (_ADR, 0x00)
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x1F, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SEC0)
                {
                    Name (_ADR, 0x01)
                    Name (SSTM, Buffer (0x14)
                    {
                        /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x1F, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SSTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SSTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Method (DRMP, 0, NotSerialized)
                {
                    Return (\_SB.R_S0)
                }
            }

            Device (MMTM)
            {
                Name (_HID, EisaId ("PNP0103"))
                Name (_UID, 0x00)
                Name (MTB0, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {0}
                    IRQNoFlags ()
                        {8}
                    Memory32Fixed (ReadOnly,
                        0x00000000,         // Address Base
                        0x00000400,         // Address Length
                        _Y01)
                })
                CreateDWordField (MTB0, \_SB.PCI0.MMTM._Y01._BAS, TBAS)
                Name (MTB1, ResourceTemplate ()
                {
                })
                Method (_STA, 0, NotSerialized)
                {
                    If (And (\_SB.PCI0.LPC0.MTSE, 0x04))
                    {
                        Return (0x0F)
                    }

                    Return (0x00)
                }

                Method (_CRS, 0, Serialized)
                {
                    If (And (\_SB.PCI0.LPC0.MTSE, 0x04))
                    {
                        Store (\_SB.PCI0.LPC0.MTBA, TBAS)
                        Return (MTB0)
                    }
                    Else
                    {
                        Return (MTB1)
                    }
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00010000)
                Mutex (PSMX, 0x00)
                OperationRegion (P44, PCI_Config, 0x44, 0x04)
                Field (P44, AnyAcc, NoLock, Preserve)
                {
                    MTBA,   32
                }

                OperationRegion (MMTO, PCI_Config, 0x74, 0x04)
                Field (MMTO, DWordAcc, NoLock, Preserve)
                {
                    MTSE,   32
                }

                Device (MBRD)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x1F)
                    Name (RSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        Return (RSRC)
                    }
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
                                _Y02)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y03)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y04)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y05)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y06)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x80,               // Length
                                _Y07)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x40,               // Length
                                _Y08)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x40,               // Length
                                _Y09)
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x40,               // Length
                                _Y0A)
                        })
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y02._MIN, I1MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y02._MAX, I1MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y03._MIN, I2MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y03._MAX, I2MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y04._MIN, I3MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y04._MAX, I3MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y05._MIN, I4MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y05._MAX, I4MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y06._MIN, I5MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y06._MAX, I5MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y07._MIN, I6MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y07._MAX, I6MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y08._MIN, I7MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y08._MAX, I7MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y09._MIN, I8MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y09._MAX, I8MX)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y0A._MIN, I9MN)
                        CreateWordField (IORT, \_SB.PCI0.LPC0.PMIO._CRS._Y0A._MAX, I9MX)
                        And (\_SB.PCI0.SMB0.PMBR, 0xFFFC, I1MN)
                        Store (I1MN, I1MX)
                        Add (I1MN, 0x80, Local0)
                        Store (Local0, I2MN)
                        Store (Local0, I2MX)
                        And (\_SB.PCI0.SMB0.NVSB, 0xFFFC, I3MN)
                        Store (I3MN, I3MX)
                        Add (I3MN, 0x80, Local0)
                        Store (Local0, I4MN)
                        Store (Local0, I4MX)
                        And (\_SB.PCI0.SMB0.ANLG, 0xFFFC, I5MN)
                        Store (I5MN, I5MX)
                        Add (I5MN, 0x80, Local0)
                        Store (Local0, I6MN)
                        Store (Local0, I6MX)
                        And (\_SB.PCI0.SMB0.SB20, 0xFFFC, I7MN)
                        Store (I7MN, I7MX)
                        And (\_SB.PCI0.SMB0.SB24, 0xFFFC, I8MN)
                        Store (I8MN, I8MX)
                        And (\_SB.PCI0.SMB0.SB7C, 0xFFFC, I9MN)
                        Store (I9MN, I9MX)
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
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x09,               // Length
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
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
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
                            0x0360,             // Range Minimum
                            0x0360,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x006F,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
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
                    Name (PTB0, ResourceTemplate ()
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
                    Name (PTB1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (And (\_SB.PCI0.LPC0.MTSE, 0x04))
                        {
                            Return (PTB1)
                        }
                        Else
                        {
                            Return (PTB0)
                        }
                    }
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
                    Name (RCB0, ResourceTemplate ()
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
                    Name (RCB1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (And (\_SB.PCI0.LPC0.MTSE, 0x04))
                        {
                            Return (RCB1)
                        }
                        Else
                        {
                            Return (RCB0)
                        }
                    }
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

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))
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
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                }

                Device (MSE0)
                {
                    Name (_HID, EisaId ("SYN1B02"))
                    Name (_CID, Package (0x03)
                    {
                        0x001B2E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

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
                                _Y0B)
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y0C)
                            Memory32Fixed (ReadWrite,
                                0x00000000,         // Address Base
                                0x00000000,         // Address Length
                                _Y0D)
                        })
                        CreateDWordField (MEMR, \_SB.PCI0.LPC0.MEM0._CRS._Y0B._BAS, MBAS)
                        CreateDWordField (MEMR, \_SB.PCI0.LPC0.MEM0._CRS._Y0B._LEN, MBLE)
                        CreateDWordField (MEMR, \_SB.PCI0.LPC0.MEM0._CRS._Y0C._BAS, WDTB)
                        CreateDWordField (MEMR, \_SB.PCI0.LPC0.MEM0._CRS._Y0C._LEN, WDLE)
                        CreateDWordField (MEMR, \_SB.PCI0.LPC0.MEM0._CRS._Y0D._BAS, NVAB)
                        CreateDWordField (MEMR, \_SB.PCI0.LPC0.MEM0._CRS._Y0D._LEN, NVAL)
                        If (\_SB.PCI0.LPC0.MTBA)
                        {
                            Store (\_SB.PCI0.LPC0.MTBA, MBAS)
                            Store (0x1000, MBLE)
                        }

                        If (\_SB.PCI0.SMB0.WDTA)
                        {
                            Store (\_SB.PCI0.SMB0.WDTA, WDTB)
                            Store (0x1000, WDLE)
                        }

                        If (\_SB.PCI0.SMB0.NVAM)
                        {
                            Store (\_SB.PCI0.SMB0.NVAM, NVAB)
                            Store (0x1000, NVAL)
                        }

                        Return (MEMR)
                    }
                }

                Device (CIR)
                {
                    Method (_HID, 0, NotSerialized)
                    {
                        If (LLess (OSYS, 0x07D6))
                        {
                            Return (0x2310A35C)
                        }
                        Else
                        {
                            Return (0x2010A35C)
                        }
                    }

                    OperationRegion (WBIO, SystemIO, 0x2E, 0x02)
                    Field (WBIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (WBMX, 0x00)
                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x30), 
                        ACTR,   1, 
                                Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                                Offset (0x70), 
                        INTR,   8
                    }

                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (WBMX, 0xFFFF)
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Release (WBMX)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        ENFG (0x03)
                        Store (ACTR, Local0)
                        EXFG ()
                        If (Local0)
                        {
                            Store (0x0F, Local0)
                        }
                        Else
                        {
                            Store (0x0D, Local0)
                            \_SB.PCI0.LPC0.CIR._DIS ()
                        }

                        If (LLess (OSYS, 0x07D6))
                        {
                            ENFG (0x03)
                            Store (0x00, IOAH)
                            Store (0x00, IOAL)
                            EXFG ()
                        }

                        Return (Local0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG (0x03)
                        Store (0x00, ACTR)
                        Store (0x00, IOAH)
                        Store (0x00, IOAL)
                        Store (0x00, INTR)
                        EXFG ()
                        ENFG (0x04)
                        Store (0x00, ACTR)
                        Store (0x00, IOAH)
                        Store (0x00, IOAL)
                        EXFG ()
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (PRS1, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0600,             // Range Minimum
                                    0x0600,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0620,             // Range Minimum
                                    0x0620,             // Range Maximum
                                    0x01,               // Alignment
                                    0x20,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                            /*** Disassembler: inserted missing EndDependentFn () ***/
                        })
                        Name (PRS2, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0620,             // Range Minimum
                                    0x0620,             // Range Maximum
                                    0x01,               // Alignment
                                    0x20,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                            /*** Disassembler: inserted missing EndDependentFn () ***/
                        })
                        If (LLess (OSYS, 0x07D6))
                        {
                            Return (PRS2)
                        }
                        Else
                        {
                            Return (PRS1)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (DCRS, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IRQNoFlags ()
                                {7}
                        })
                        Name (CRS1, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0600,             // Range Minimum
                                0x0600,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0620,             // Range Minimum
                                0x0620,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                        })
                        Name (CRS2, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0620,             // Range Minimum
                                0x0620,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                        })
                        ENFG (0x03)
                        Store (ACTR, Local0)
                        EXFG ()
                        If (Local0)
                        {
                            If (LLess (OSYS, 0x07D6))
                            {
                                Return (CRS2)
                            }
                            Else
                            {
                                Return (CRS1)
                            }
                        }
                        Else
                        {
                            Return (DCRS)
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LLess (OSYS, 0x07D6))
                        {
                            CreateByteField (Arg0, 0x02, IO1L)
                            CreateByteField (Arg0, 0x03, IO1H)
                            CreateWordField (Arg0, 0x09, IRQX)
                            FindSetRightBit (IRQX, Local0)
                            Decrement (Local0)
                            ENFG (0x03)
                            Store (0x00, INTR)
                            Store (0x00, IOAH)
                            Store (0x00, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                            ENFG (0x04)
                            Store (Local0, INTR)
                            Store (IO1H, IOAH)
                            Store (IO1L, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                        Else
                        {
                            CreateByteField (Arg0, 0x02, AD1L)
                            CreateByteField (Arg0, 0x03, AD1H)
                            CreateByteField (Arg0, 0x0A, AD2L)
                            CreateByteField (Arg0, 0x0B, AD2H)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x03)
                            Store (Local0, INTR)
                            Store (AD1H, IOAH)
                            Store (AD1L, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                            ENFG (0x04)
                            Store (AD2H, IOAH)
                            Store (AD2L, IOAL)
                            Store (0x01, ACTR)
                            EXFG ()
                        }
                    }
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
                    Name (_GPE, 0x10)
                    Name (SEL0, 0xF0)
                    Name (BFLG, 0x00)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Local0)
                            If (Local0)
                            {
                                Store (0x01, \_SB.ECOK)
                            }
                            Else
                            {
                                Store (0x00, \_SB.ECOK)
                            }
                        }

                        If (\_SB.ECOK)
                        {
                            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                            Store (0x03, \_SB.PCI0.LPC0.EC0.RG59)
                            Store (\_SB.PCI0.LPC0.BTEN, \_SB.PCI0.LPC0.EC0.BLTH)
                            Store (\_SB.PCI0.LPC0.WLAN, \_SB.PCI0.LPC0.EC0.WLAN)
                            Store (0x01, \_SB.PCI0.LPC0.EC0.CPLE)
                            Store (\_SB.PCI0.LPC0.PHSR (0x05, 0x00), DOFF)
                            Release (\_SB.PCI0.LPC0.EC0.MUT1)
                        }
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
                            ,   5, 
                        FLS4,   1, 
                                Offset (0x42), 
                                Offset (0x4C), 
                        ARCD,   1, 
                            ,   3, 
                        DOCK,   1, 
                        LANC,   1, 
                        LIDS,   1, 
                        CRTS,   1, 
                                Offset (0x51), 
                        BLVL,   8, 
                                Offset (0x53), 
                        DOFF,   8, 
                                Offset (0x58), 
                        CTMP,   8, 
                        RG59,   8, 
                                Offset (0x60), 
                        WLAN,   1, 
                        BLTH,   1, 
                        CPLE,   1, 
                            ,   3, 
                        WLST,   1, 
                        BLTS,   1, 
                            ,   3, 
                        MNST,   1, 
                                Offset (0x62), 
                                Offset (0x63), 
                            ,   7, 
                        VGAF,   1, 
                                Offset (0x70), 
                        BTMD,   8, 
                        MBTS,   1, 
                        MBTF,   1, 
                        BATF,   1, 
                            ,   3, 
                        MBDX,   1, 
                        MBAD,   1, 
                        MBTC,   1, 
                            ,   2, 
                        LION,   1, 
                                Offset (0x77), 
                        BA1C,   8, 
                        MCYC,   16, 
                        MTMP,   16, 
                        MDAT,   16, 
                        MCUR,   16, 
                        MBRM,   16, 
                        MBVG,   16, 
                        MRTF,   16, 
                        MMER,   8, 
                        BA2C,   8, 
                        LFCC,   16, 
                        BTSN,   16, 
                        BTDC,   16, 
                        BTDV,   16, 
                        BTMN,   8, 
                                Offset (0x93), 
                        BTST,   8, 
                                Offset (0x9D), 
                        OSTP,   1, 
                                Offset (0xA0), 
                        ABMD,   8, 
                        ABTS,   1, 
                        ABFC,   1, 
                            ,   4, 
                        ABDX,   1, 
                        ABAD,   1, 
                        ABCG,   1, 
                            ,   2, 
                        ABTP,   1, 
                                Offset (0xA8), 
                        ACYC,   16, 
                        ATMP,   16, 
                        ADAT,   16, 
                        ABCR,   16, 
                        ABRM,   16, 
                        ABVG,   16, 
                        ARTF,   16, 
                        AMER,   8, 
                                Offset (0xB8), 
                        AFCC,   16, 
                        ABSN,   16, 
                        ABDC,   16, 
                        ABDV,   16, 
                        ABMN,   8, 
                                Offset (0xD0), 
                        EBPL,   1, 
                                Offset (0xD1), 
                        PWRE,   1, 
                                Offset (0xD2), 
                            ,   6, 
                        VAUX,   1, 
                                Offset (0xD6), 
                        DBPL,   8
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
                            \_SB.BAT1.Z00B ()
                            Notify (\_SB.ACAD, 0x80)
                            Sleep (0x64)
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
                    Method (_QA0, 0, NotSerialized)
                    {
                        If (LEqual (CPUT, 0x00))
                        {
                            Store (0x01, CPUT)
                            Store (PNUM, Local1)
                            If (LLess (\_PR.CPU0._PPC, Local1))
                            {
                                Store (Local1, \_PR.CPU0._PPC)
                                Notify (\_PR.CPU0, 0x80)
                                If (LEqual (CNUM, 0x01))
                                {
                                    Sleep (0x64)
                                    Store (Local1, \_PR.CPU1._PPC)
                                    Notify (\_PR.CPU1, 0x80)
                                    Sleep (0x64)
                                }
                            }
                        }
                    }

                    Method (_QA1, 0, NotSerialized)
                    {
                        If (LNotEqual (CPUT, 0x00))
                        {
                            Store (0x00, CPUT)
                            If (LNotEqual (\_PR.CPU0._PPC, 0x00))
                            {
                                Store (0x00, \_PR.CPU0._PPC)
                                Notify (\_PR.CPU0, 0x80)
                                If (LEqual (CNUM, 0x01))
                                {
                                    Sleep (0x64)
                                    Store (0x00, \_PR.CPU1._PPC)
                                    Notify (\_PR.CPU1, 0x80)
                                    Sleep (0x64)
                                }
                            }
                        }
                    }

                    Method (_Q9B, 0, NotSerialized)
                    {
                        Notify (\_SB.LID, 0x80)
                    }

                    Method (_Q9C, 0, NotSerialized)
                    {
                        Notify (\_SB.LID, 0x80)
                    }

                    Method (_QA2, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.XVR1.Z005, 0x00)
                    }

                    Method (_QA3, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.XVR1, 0x01)
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q90, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x01, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q91, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x02, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q92, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x03, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q93, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x04, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q8E, 0, NotSerialized)
                    {
                        Store (0x86, BRUD)
                        _Q8F ()
                        Store (0x00, BRUD)
                    }

                    Method (_Q8F, 0, NotSerialized)
                    {
                        If (LLess (OSYS, 0x07D6))
                        {
                            If (LEqual (\_SB.WMID.BAEF, 0x01))
                            {
                                Store (0x05, \_SB.WMID.WMIQ)
                                Notify (\_SB.WMID, 0x80)
                                Sleep (0xC8)
                            }
                        }

                        Store (0x03, BOWN)
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.BLVL, Local0)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                        \_SB.WMID.Z00C (Local0)
                        Store (Local0, BRTN)
                    }

                    Method (_Q94, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x09, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x82)
                        }
                    }

                    Method (_Q95, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x08, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x82)
                        }
                    }

                    Method (_Q8A, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x0B, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q8B, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x0C, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q9D, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x0F, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }

                    Method (_Q9E, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.WMID.BAEF, 0x01))
                        {
                            Store (0x10, \_SB.WMID.WMIQ)
                            Notify (\_SB.WMID, 0x80)
                        }
                    }
                }

                OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x7FEE5E2D, 0x00000120)
                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    BCMD,   8, 
                    DID,    32, 
                    INFO,   1024
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            AccessAs (ByteAcc, 0x00), 
                            Offset (0x05), 
                    INF,    8
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x50), 
                    BLK0,   64, 
                    BLK1,   64, 
                    BLK2,   64, 
                    BLK3,   64, 
                    BLK4,   64, 
                            Offset (0x110), 
                    BTEN,   1, 
                    WLAN,   1, 
                    DOCK,   1, 
                    IDEC,   1, 
                    TPMS,   1, 
                    G3LN,   1, 
                            Offset (0x111), 
                    PNUM,   8, 
                    CNUM,   8
                }

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
            }

            Device (K801)
            {
                Name (_ADR, 0x00180001)
                OperationRegion (HMM0, PCI_Config, 0x88, 0x20)
                Field (HMM0, ByteAcc, NoLock, Preserve)
                {
                    PMB0,   32, 
                    PML0,   32, 
                    PMB1,   32, 
                    PML1,   32
                }

                OperationRegion (HMM1, PCI_Config, 0xC0, 0x20)
                Field (HMM1, ByteAcc, NoLock, Preserve)
                {
                    PIB0,   32, 
                    PIL0,   32, 
                    PIB1,   32, 
                    PIL1,   32
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
                    INTA,   4, 
                    INTB,   4, 
                    INTC,   4, 
                    INTD,   4, 
                    ISCI,   4, 
                    ITCO,   4, 
                    ISMB,   4, 
                    IUS2,   4, 
                    INTU,   4, 
                    INTS,   4, 
                    PSI1,   4, 
                    PSI0,   4, 
                    IUS0,   4, 
                    IUS1,   4, 
                    IMAC,   4, 
                    IAZA,   4, 
                    Z00D,   4, 
                    Z00E,   4, 
                    IPID,   4, 
                    Z00F,   4
                }
            }

            Scope (\_SB.PCI0)
            {
                Name (BUFA, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {5,7,10,11,14,15}
                })
                Name (BUFB, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y0E)
                        {}
                })
                Name (BUFC, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {14,15}
                })
                CreateWordField (BUFB, \_SB.PCI0._Y0E._INT, IRQV)
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

                Name (BUFI, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                    {
                        0x00000010,
                        0x00000011,
                        0x00000012,
                        0x00000013,
                        0x00000014,
                    }
                })
                Name (BUFJ, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                    {
                        0x00000015,
                        0x00000016,
                        0x00000017,
                    }
                })
                Name (BUFF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                    {
                        0x00000005,
                        0x00000007,
                        0x0000000A,
                        0x0000000B,
                        0x0000000E,
                        0x0000000F,
                    }
                })
                Method (CRSI, 1, Serialized)
                {
                    Name (IRZ5, ResourceTemplate ()
                    {
                        Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, _Y0F)
                        {
                            0x00000007,
                        }
                    })
                    CreateWordField (IRZ5, \_SB.PCI0.CRSI._Y0F._INT, INZ5)
                    Store (Arg0, Local0)
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (0x10, Local0)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (0x11, Local0)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (0x12, Local0)
                    }

                    If (LEqual (Arg0, 0x0C))
                    {
                        Store (0x13, Local0)
                    }

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

                    If (LEqual (Arg0, 0x01))
                    {
                        Store (0x17, Local0)
                    }

                    Store (Local0, INZ5)
                    Return (IRZ5)
                }

                Method (SRSI, 1, Serialized)
                {
                    CreateWordField (Arg0, 0x05, IRZ6)
                    Store (IRZ6, Local0)
                    If (LEqual (IRZ6, 0x10))
                    {
                        Store (0x03, Local0)
                    }

                    If (LEqual (IRZ6, 0x11))
                    {
                        Store (0x04, Local0)
                    }

                    If (LEqual (IRZ6, 0x12))
                    {
                        Store (0x06, Local0)
                    }

                    If (LEqual (IRZ6, 0x13))
                    {
                        Store (0x0C, Local0)
                    }

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

                    If (LEqual (IRZ6, 0x17))
                    {
                        Store (0x01, Local0)
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
                            Return (BUFF)
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
                            Return (CRSI (INTW))
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
                            Store (SRSI (Arg0), INTW)
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
                            Return (BUFF)
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
                            Return (CRSI (INTX))
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
                            Store (SRSI (Arg0), INTX)
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
                            Return (BUFF)
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
                            Return (CRSI (INTY))
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
                            Store (SRSI (Arg0), INTY)
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
                            Return (BUFF)
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
                            Return (CRSI (INTZ))
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
                            Store (SRSI (Arg0), INTZ)
                        }
                    }
                }

                Device (LK1E)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (INTA)
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
                        Store (0x00, INTA)
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
                            Return (CRS (INTA))
                        }
                        Else
                        {
                            Return (CRSI (INTA))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), INTA)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), INTA)
                        }
                    }
                }

                Device (LK2E)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (INTB)
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
                        Store (0x00, INTB)
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
                            Return (CRS (INTB))
                        }
                        Else
                        {
                            Return (CRSI (INTB))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), INTB)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), INTB)
                        }
                    }
                }

                Device (LK3E)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (INTC)
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
                        Store (0x00, INTC)
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
                            Return (CRS (INTC))
                        }
                        Else
                        {
                            Return (CRSI (INTC))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), INTC)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), INTC)
                        }
                    }
                }

                Device (LK4E)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (INTD)
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
                        Store (0x00, INTD)
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
                            Return (CRS (INTD))
                        }
                        Else
                        {
                            Return (CRSI (INTD))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), INTD)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), INTD)
                        }
                    }
                }

                Device (LSMB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x09)
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
                    Name (_UID, 0x0A)
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

                Device (LUS2)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x0B)
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
                    Name (_UID, 0x0C)
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

                Device (LAZA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x0D)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (IAZA)
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
                        Store (0x00, IAZA)
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
                            Return (CRS (IAZA))
                        }
                        Else
                        {
                            Return (CRSI (IAZA))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), IAZA)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), IAZA)
                        }
                    }
                }

                Device (LGPU)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x0E)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (Z00E)
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
                        Store (0x00, Z00E)
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Return (BUFA)
                        }
                        Else
                        {
                            Return (BUFJ)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Return (CRS (Z00E))
                        }
                        Else
                        {
                            Return (CRSI (Z00E))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), Z00E)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), Z00E)
                        }
                    }
                }

                Device (LPID)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x0F)
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
                        }
                        Else
                        {
                            Store (SRSI (Arg0), IPID)
                        }
                    }
                }

                Device (LSI0)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x10)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PSI0)
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
                        Store (0x00, PSI0)
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
                            Return (CRS (PSI0))
                        }
                        Else
                        {
                            Return (CRSI (PSI0))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), PSI0)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), PSI0)
                        }
                    }
                }

                Device (Z002)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x12)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (Z00F)
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
                        Store (0x00, Z00F)
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
                            Return (CRS (Z00F))
                        }
                        Else
                        {
                            Return (CRSI (Z00F))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), Z00F)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), Z00F)
                        }
                    }
                }

                Device (Z003)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x13)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (Z00D)
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
                        Store (0x00, Z00D)
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
                            Return (CRS (Z00D))
                        }
                        Else
                        {
                            Return (CRSI (Z00D))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), Z00D)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), Z00D)
                        }
                    }
                }

                Device (LPMU)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x14)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (INTS)
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
                        Store (0x00, INTS)
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
                            Return (CRS (INTS))
                        }
                        Else
                        {
                            Return (CRSI (INTS))
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LNot (PICF))
                        {
                            Store (SRS (Arg0), INTS)
                        }
                        Else
                        {
                            Store (SRSI (Arg0), INTS)
                        }
                    }
                }
            }
        }

        Device (ACAD)
        {
            Method (_HID, 0, NotSerialized)
            {
                If (INSX)
                {
                    Store (0x00, INSX)
                    If (LNotEqual (\_PR.CPU0._PPC, 0x00))
                    {
                        Store (\_PR.CPU0._PPC, Local1)
                        Store (0x00, \_PR.CPU0._PPC)
                        Notify (\_PR.CPU0, 0x80)
                        Sleep (0x64)
                        Store (Local1, \_PR.CPU0._PPC)
                        Notify (\_PR.CPU0, 0x80)
                        If (LEqual (\_SB.PCI0.LPC0.CNUM, 0x01))
                        {
                            Sleep (0x64)
                            Store (\_PR.CPU1._PPC, Local1)
                            Store (0x00, \_PR.CPU1._PPC)
                            Notify (\_PR.CPU1, 0x80)
                            Sleep (0x64)
                            Store (Local1, \_PR.CPU1._PPC)
                            Notify (\_PR.CPU1, 0x80)
                            Sleep (0x64)
                        }
                    }
                }

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
                0xFFFFFFFF, 
                0xFFFFFFFF, 
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
                    Store (\_SB.PCI0.LPC0.EC0.LION, Local6)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    Store (Local0, Index (PBIF, 0x01))
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
                    Store ("Chapala", Index (PBIF, 0x09))
                    If (LEqual (Local4, 0x08))
                    {
                        Store ("MOTOROLA", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x07))
                        {
                            Store ("SIMPLO", Index (PBIF, 0x0C))
                        }
                        Else
                        {
                            If (LEqual (Local4, 0x03))
                            {
                                Store ("SANYO", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local4, 0x04))
                                {
                                    Store ("SONY", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local4, 0x05))
                                    {
                                        Store ("PANASONIC", Index (PBIF, 0x0C))
                                    }
                                    Else
                                    {
                                        Store ("UNKNOWN", Index (PBIF, 0x0C))
                                    }
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
                            If (LEqual (Local0, 0x01))
                            {
                                Store (0x02, Local7)
                            }
                            Else
                            {
                                Store (0x00, Local7)
                            }
                        }
                    }
                    Else
                    {
                        If (LAnd (Local4, 0x01))
                        {
                            Store (0x01, Local7)
                        }
                        Else
                        {
                            Store (0x00, Local7)
                        }
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
                        Store (Local2, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNotEqual (Local3, 0xFFFF))
                        {
                            Not (Local3, Local3)
                            Increment (Local3)
                            And (Local3, 0xFFFF, Local3)
                        }
                    }

                    Store (Local3, Index (PBST, 0x01))
                }

                Return (PBST)
            }

            Method (Z00B, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.MBTS, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    If (LEqual (Local0, 0x01))
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
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPC0.EC0.LIDS, Local0)
                    Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    If (Local0)
                    {
                        Return (0x01)
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }
                Else
                {
                    Return (0x01)
                }
            }
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
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.CTMP, Local0)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                        Return (Add (Multiply (Local0, 0x0A), 0x0AAC))
                    }
                    Else
                    {
                        Return (0x0C3C)
                    }
                }

                Method (_PSV, 0, NotSerialized)
                {
                    Return (Add (Multiply (0x69, 0x0A), 0x0AAC))
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
                    Return (Add (Multiply (0x64, 0x0A), 0x0AAC))
                }
            }
        }

        Scope (\_SB)
        {
            Device (WMID)
            {
                Name (_HID, "PNP0C14")
                Name (_UID, 0x00)
                Name (WMIQ, 0x00)
                Name (ERRD, 0x00010000)
                Name (BUFF, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BUFF, 0x00, BF00)
                CreateByteField (BUFF, 0x01, BF01)
                CreateByteField (BUFF, 0x02, BF02)
                CreateByteField (BUFF, 0x03, BF03)
                Name (AADS, Buffer (0x04)
                {
                    0x00
                })
                CreateField (AADS, 0x00, 0x04, AS00)
                CreateField (AADS, 0x04, 0x01, AS01)
                CreateField (AADS, 0x05, 0x01, AS02)
                CreateField (AADS, 0x10, 0x10, AS03)
                CreateField (AADS, 0x00, 0x10, AS04)
                Name (BAEF, 0x00)
                Name (BADF, 0x00)
                Name (BADG, Package (0x03)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (BADS, Package (0x04)
                {
                    0x01, 
                    0x01, 
                    0x01, 
                    0x01
                })
                Name (WLDS, 0x00)
                Name (WLED, 0x00)
                Name (BTDS, 0x00)
                Name (BTED, 0x00)
                Name (BLDS, 0x00)
                Name (BLED, 0x00)
                Name (NTDC, 0x00)
                Name (WLSD, 0x0100)
                Name (WLSE, 0x0101)
                Name (BLTD, 0x0200)
                Name (BLTE, 0x0201)
                Name (LBL0, 0x0300)
                Name (LBL1, 0x0301)
                Name (LBL2, 0x0302)
                Name (LBL3, 0x0303)
                Name (LBL4, 0x0304)
                Name (LBL5, 0x0305)
                Name (LBL6, 0x0306)
                Name (LBL7, 0x0307)
                Name (LBL8, 0x0308)
                Name (LBL9, 0x0309)
                Name (LBLA, 0x030A)
                Name (LBLB, 0x030B)
                Name (LBLC, 0x030C)
                Name (LBLD, 0x030D)
                Name (LBLE, 0x030E)
                Name (LBLF, 0x030F)
                Name (CADI, 0x0401)
                Name (CADO, 0x0400)
                Name (LOWG, 0x0501)
                Name (HIHG, 0x0502)
                Name (VAPO, 0x0600)
                Name (VAPI, 0x0601)
                Name (WBAT, 0x0700)
                Name (WADA, 0x0701)
                Name (DS3G, 0x0800)
                Name (EN3G, 0x0801)
                Name (LANI, 0x0900)
                Name (LANO, 0x0901)
                Name (MNOF, 0x0A00)
                Name (MNON, 0x0A01)
                Name (BBSB, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (BBSB, 0x00, 0x10, BBD0)
                CreateField (BBSB, 0x10, 0x10, BBD1)
                Name (TLS0, 0x00)
                Name (TLS1, 0x01)
                Name (TLS2, 0x02)
                Name (TLS3, 0x03)
                Name (TLS4, 0x04)
                Name (TLS5, 0x05)
                Name (TLS6, 0x06)
                Name (TLS7, 0x07)
                Name (BBPD, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BBPD, 0x00, BBP0)
                CreateByteField (BBPD, 0x04, BBP1)
                CreateByteField (BBPD, 0x08, BBP2)
                CreateByteField (BBPD, 0x0C, BBP3)
                CreateByteField (BBPD, 0x10, BBP4)
                Name (BBAR, Buffer (0x08)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BBAR, 0x00, BBA0)
                CreateByteField (BBAR, 0x04, BBA1)
                Name (BCDS, Package (0x0D)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (BDDS, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (BDDS, 0x00, 0x10, BDD0)
                CreateField (BDDS, 0x10, 0x10, BDD1)
                Name (DSY0, Buffer (0x28)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY1, Buffer (0x18)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY2, Buffer (0x10)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY3, Buffer (0x18)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY4, Buffer (0x10)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY5, Buffer (0x28)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY0, 0x00, 0x40, DY00)
                CreateField (DSY0, 0x40, 0x40, DY01)
                CreateField (DSY0, 0x80, 0x40, DY02)
                CreateField (DSY0, 0xC0, 0x40, DY03)
                CreateField (DSY0, 0x0100, 0x40, DY04)
                CreateField (DSY1, 0x00, 0x40, DY10)
                CreateField (DSY1, 0x40, 0x40, DY11)
                CreateField (DSY1, 0x80, 0x40, DY12)
                CreateField (DSY2, 0x00, 0x40, DY20)
                CreateField (DSY2, 0x40, 0x10, DY21)
                CreateField (DSY2, 0x50, 0x10, DY22)
                CreateField (DSY0, 0x00, 0xC0, DSX4)
                Name (BEDS, Package (0x10)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (WIT0, 0x00)
                Name (DSY6, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY6, 0x00, 0x20, DY60)
                CreateField (DSY6, 0x20, 0x20, DY61)
                CreateField (DSY6, 0x40, 0x20, DY62)
                CreateField (DSY6, 0x60, 0x20, DY63)
                CreateField (DSY6, 0x80, 0x20, DY64)
                Name (WPRW, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPRW, 0x00, 0x08, WWD0)
                CreateField (WPRW, 0x08, 0x08, WWD1)
                CreateField (WPRW, 0x10, 0x08, WWD2)
                CreateField (WPRW, 0x18, 0x08, WWD3)
                CreateField (WPRW, 0x20, 0x08, WWD4)
                CreateField (WPRW, 0x28, 0x20, WWD5)
                Name (WPCI, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPCI, 0x00, 0x08, WPIR)
                CreateField (WPCI, 0x08, 0x03, WPIF)
                CreateField (WPCI, 0x0B, 0x05, WPID)
                CreateField (WPCI, 0x10, 0x08, WPIB)
                Name (BFDS, Package (0x04)
                {
                    0x02, 
                    0x02, 
                    0x02, 
                    0x02
                })
                Name (GSTS, 0x00)
                Name (BFEF, 0x00)
                Name (BGEF, 0x00)
                Name (BGDS, Package (0x01)
                {
                    0x01
                })
                Method (PHSR, 2, NotSerialized)
                {
                    Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
                    Store (0x91, \_SB.PCI0.LPC0.BCMD)
                    Store (Arg0, \_SB.PCI0.LPC0.DID)
                    Store (Arg1, \_SB.PCI0.LPC0.INF)
                    Store (Zero, \_SB.PCI0.LPC0.SMIC)
                    Store (\_SB.PCI0.LPC0.DID, Local0)
                    Release (\_SB.PCI0.LPC0.PSMX)
                    Return (Local0)
                }

                Method (AAF1, 0, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x00, 0x00), AS04)
                    Store (0x00, AS02)
                    Store (0x00, AS03)
                }

                Method (Z00G, 1, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (\_SB.WMID.PHSR (0x01, 0x00), BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (\_SB.WMID.PHSR (0x01, 0x01), BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Store (BRTN, Local0)
                                    Store (Local0, BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x08))
                                    {
                                        Store (\_SB.WMID.PHSR (0x01, 0x03), BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x09))
                                        {
                                            Store (\_SB.WMID.PHSR (0x01, 0x04), BUFF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x0A))
                                            {
                                                Store (\_SB.WMID.PHSR (0x01, 0x05), BUFF)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x0C))
                                                {
                                                    Store (0x00010000, BUFF)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x0D))
                                                    {
                                                        If (\_SB.ECOK)
                                                        {
                                                            Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                                                            Store (\_SB.PCI0.LPC0.EC0.MNST, Local0)
                                                            Release (\_SB.PCI0.LPC0.EC0.MUT1)
                                                        }

                                                        Store (And (Local0, 0x01), BUFF)
                                                    }
                                                    Else
                                                    {
                                                        Store (0x00010000, BUFF)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (Z00H, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    If (LEqual (BF00, 0x00))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Store (0x01, Local0)
                    }

                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x04))
                        {
                            Or (Local0, 0x10, Local0)
                            Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                            Store (0x00, BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x05))
                            {
                                Or (Local0, 0x20, Local0)
                                Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                                Store (0x00, BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x06))
                                {
                                    If (LLess (OSYS, 0x07D6))
                                    {
                                        Store (BF00, Local0)
                                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                                        Store (Local0, \_SB.PCI0.LPC0.EC0.BLVL)
                                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                                        Store (Local0, BRTN)
                                    }
                                    Else
                                    {
                                        If (LEqual (\BOWN, 0x00))
                                        {
                                            Store (BF00, Local1)
                                            Or (BF00, 0x40, Local0)
                                            Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                                            Store (0x02, \BOWN)
                                            Store (Local1, Local0)
                                            Sleep (0x01F4)
                                            Z00C (Local0)
                                            Store (Local0, BRTN)
                                        }
                                        Else
                                        {
                                            Store (0x00, \BOWN)
                                        }
                                    }

                                    Store (0x00, BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x0B))
                                    {
                                        Or (Local0, 0x80, Local0)
                                        Store (\_SB.WMID.PHSR (0x02, Local0), BUFF)
                                        Store (0x00, BUFF)
                                    }
                                    Else
                                    {
                                        Store (0x00010000, BUFF)
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (Z00I, 0, NotSerialized)
                {
                    Store (\_SB.WMID.WMIQ, Local0)
                    Store (0x00, \_SB.WMID.WMIQ)
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Local0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Return (WLSE)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Return (WLSD)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Return (BLTE)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x04))
                                    {
                                        Return (BLTD)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x05))
                                        {
                                            Store (\_SB.WMID.PHSR (0x01, 0x02), Local1)
                                            And (Local1, 0x0F, Local1)
                                            And (LBL0, 0x0F00, LBL0)
                                            Or (Local1, LBL0, LBL0)
                                            Return (LBL0)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x06))
                                            {
                                                Return (LOWG)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x07))
                                                {
                                                    Return (HIHG)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x08))
                                                    {
                                                        Return (VAPO)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x09))
                                                        {
                                                            Return (VAPI)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x0A))
                                                            {
                                                                Return (LOWG)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_0, 0x0B))
                                                                {
                                                                    Return (LANI)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_0, 0x0C))
                                                                    {
                                                                        Return (LANO)
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_0, 0x0D))
                                                                        {
                                                                            Return (EN3G)
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (_T_0, 0x0E))
                                                                            {
                                                                                Return (DS3G)
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (_T_0, 0x0F))
                                                                                {
                                                                                    Return (MNON)
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (_T_0, 0x10))
                                                                                    {
                                                                                        Return (MNOF)
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                        Return (0xFFFF)
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
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (Z00J, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    And (BF00, 0x0F, Local0)
                    If (LEqual (Arg0, 0x02))
                    {
                        ShiftLeft (Local0, 0x01, Local0)
                        Or (Local0, 0x10, Local0)
                    }

                    Store (\_SB.WMID.PHSR (0x03, Local0), BBSB)
                }

                Method (Z00K, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x10, Arg0), BUFF)
                    Store (BF00, BBP0)
                    Store (BF01, BBP1)
                    Store (BF02, BBP2)
                    Store (And (BF03, 0x0F), BBP3)
                    Store (ShiftRight (And (BF03, 0xF0), 0x04), BBP4)
                }

                Method (Z00L, 2, NotSerialized)
                {
                }

                Method (Z00M, 1, NotSerialized)
                {
                    \_SB.WMID.PHSR (0x04, Arg0)
                    Store (\_SB.PCI0.LPC0.BLK0, DY00)
                    Store (\_SB.PCI0.LPC0.BLK1, DY01)
                    Store (\_SB.PCI0.LPC0.BLK2, DY02)
                    Store (\_SB.PCI0.LPC0.BLK3, DY03)
                    Store (0x00, DY04)
                }

                Method (Z00N, 1, NotSerialized)
                {
                    Store (DY10, \_SB.PCI0.LPC0.BLK0)
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (DY11, \_SB.PCI0.LPC0.BLK1)
                        Store (DY12, \_SB.PCI0.LPC0.BLK2)
                    }

                    Store (\_SB.WMID.PHSR (0x05, Arg0), Local0)
                    Store (\_SB.PCI0.LPC0.BLK0, DY10)
                    Store (\_SB.PCI0.LPC0.BLK1, DY11)
                    If (Local0)
                    {
                        Store (0x01, DY12)
                    }
                    Else
                    {
                        Store (0x00, DY12)
                    }
                }

                Method (Z00O, 2, NotSerialized)
                {
                    Store (0x00010000, BUFF)
                    Return (BUFF)
                }

                Method (Z00P, 0, NotSerialized)
                {
                }

                Method (Z00Q, 2, NotSerialized)
                {
                    Store (DSY4, DSY2)
                    Store (0x01, DY22)
                    If (LEqual (Arg0, 0x08)) {}
                    Else
                    {
                    }
                }

                Method (Z00R, 0, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x07, 0x00), BUFF)
                }

                Method (Z00S, 1, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (\_SB.BAT1._STA (), Local0)
                            If (And (Local0, 0x10))
                            {
                                Store (0x00, BUFF)
                            }
                            Else
                            {
                                Store (0x00020000, BUFF)
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (0x00010000, BUFF)
                            }
                            Else
                            {
                                Store (0x00010000, BUFF)
                            }
                        }

                        Break
                    }
                }

                Method (Z00T, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MTMP, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ATMP, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x1388, Local0)
                        Store (0x1388, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00V, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MCUR, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABCR, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00W, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MBVG, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABVG, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00X, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MBRM, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABRM, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00Y, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.LFCC, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.AFCC, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00Z, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MCYC, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ACYC, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z010, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.BTDC, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABDC, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z011, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.BTDV, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABDV, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z012, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.MDAT, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ADAT, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z013, 1, NotSerialized)
                {
                    If (\_SB.ECOK)
                    {
                        Acquire (\_SB.PCI0.LPC0.EC0.MUT1, 0xFFFF)
                        Store (\_SB.PCI0.LPC0.EC0.BTSN, Local0)
                        Store (\_SB.PCI0.LPC0.EC0.ABSN, Local1)
                        Release (\_SB.PCI0.LPC0.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                    }

                    Z00U (Arg0, Local0, Local1)
                }

                Method (Z00U, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg0, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (\_SB.BAT1._STA (), Local2)
                            If (And (Local2, 0x10))
                            {
                                Store (Arg1, Local3)
                            }
                            Else
                            {
                                Store (0xFFFF, Local3)
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (\_SB.BAT1._STA (), Local2)
                                If (And (Local2, 0x10))
                                {
                                    Store (Arg2, Local3)
                                }
                                Else
                                {
                                    Store (0xFFFF, Local3)
                                }
                            }
                            Else
                            {
                                Store (Arg1, Local3)
                            }
                        }

                        Break
                    }

                    If (LEqual (Local3, 0xFFFF))
                    {
                        Store (0x00020000, BUFF)
                    }
                    Else
                    {
                        Store (Local3, Index (BEDS, 0x01))
                        Store (DerefOf (Index (BEDS, 0x01)), BUFF)
                    }
                }

                Method (Z014, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x01), Local0)
                    If (LLessEqual (Local0, 0x01))
                    {
                        Store (\_SB.WMID.PHSR (0x08, Arg0), BUFF)
                    }
                    Else
                    {
                        Store (0x02, BUFF)
                    }
                }

                Method (Z015, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x09, Arg0), BUFF)
                }

                Method (Z016, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x01), Local0)
                    If (LLessEqual (Local0, 0x01))
                    {
                        Store (\_SB.WMID.PHSR (0x0A, Arg0), BUFF)
                    }
                    Else
                    {
                        Store (0x02, BUFF)
                    }
                }

                Method (Z017, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x0B, Arg0), BUFF)
                }

                Method (Z018, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LEqual (Local0, 0x01))
                    {
                        \_SB.WMID.PHSR (0x0D, Local0)
                    }

                    Store (0x00, BUFF)
                }

                Method (Z019, 1, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x0E, Arg0), BUFF)
                }

                Method (Z01A, 0, NotSerialized)
                {
                    Store (\_SB.WMID.PHSR (0x0F, 0x00), BUFF)
                }

                Method (Z00C, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LGreater (Local0, BRTN))
                    {
                        If (LEqual (\_SB.PCI0.XVR0.CPPE, 0x31))
                        {
                            Notify (\_SB.PCI0.XVR0.Z004.LCD0, 0x86)
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.IGPU.LCD0, 0x86)
                        }
                    }
                    Else
                    {
                        If (LLess (Local0, BRTN))
                        {
                            If (LEqual (\_SB.PCI0.XVR0.CPPE, 0x31))
                            {
                                Notify (\_SB.PCI0.XVR0.Z004.LCD0, 0x87)
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.IGPU.LCD0, 0x87)
                            }
                        }
                    }
                }

                Name (_WDG, Buffer (0xDC)
                {
                    /* 0000 */    0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                    /* 0008 */    0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                    /* 0010 */    0x41, 0x41, 0x01, 0x01, 0x58, 0xF2, 0xF4, 0x6A, 
                    /* 0018 */    0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A, 
                    /* 0020 */    0xC2, 0xD7, 0xC0, 0xD3, 0x42, 0x41, 0x01, 0x02, 
                    /* 0028 */    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                    /* 0030 */    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                    /* 0038 */    0x80, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7, 
                    /* 0040 */    0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60, 
                    /* 0048 */    0x0B, 0x4A, 0x3D, 0x39, 0x42, 0x42, 0x01, 0x02, 
                    /* 0050 */    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                    /* 0058 */    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                    /* 0060 */    0x42, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF, 
                    /* 0068 */    0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0, 
                    /* 0070 */    0xCE, 0x01, 0xC9, 0x97, 0x42, 0x44, 0x01, 0x02, 
                    /* 0078 */    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                    /* 0080 */    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                    /* 0088 */    0x42, 0x45, 0x01, 0x02, 0xB7, 0xA0, 0xC9, 0xA7, 
                    /* 0090 */    0x9D, 0x4C, 0x72, 0x4C, 0x83, 0xBB, 0x53, 0xA3, 
                    /* 0098 */    0x45, 0x91, 0x71, 0xDF, 0x42, 0x46, 0x01, 0x02, 
                    /* 00A0 */    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                    /* 00A8 */    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                    /* 00B0 */    0x42, 0x47, 0x01, 0x02, 0xA7, 0xB1, 0x85, 0xDB, 
                    /* 00B8 */    0x9A, 0x06, 0xBB, 0x4A, 0xA2, 0xB5, 0xD1, 0x86, 
                    /* 00C0 */    0xA2, 0x1B, 0x80, 0xF1, 0x81, 0x00, 0x01, 0x08, 
                    /* 00C8 */    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                    /* 00D0 */    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                    /* 00D8 */    0x82, 0x00, 0x01, 0x08
                })
                Method (WQAA, 1, NotSerialized)
                {
                    AAF1 ()
                    Store (AADS, BUFF)
                    Return (BUFF)
                }

                Method (WMBA, 3, NotSerialized)
                {
                    If (LEqual (Arg1, 0x0D))
                    {
                        Z00G (Arg1)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x0C))
                    {
                        Z00G (Arg1)
                        Return (BUFF)
                    }

                    If (LLess (Arg1, 0x04))
                    {
                        Z00G (Arg1)
                        Return (BUFF)
                    }

                    If (LAnd (LGreaterEqual (Arg1, 0x08), LLessEqual (Arg1, 0x0A)))
                    {
                        Z00G (Arg1)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x07))
                    {
                        Store (Arg2, BUFF)
                        If (BF00)
                        {
                            Store (0x01, BAEF)
                        }
                        Else
                        {
                            Store (0x00, BAEF)
                        }

                        Store (0x00, BUFF)
                        Return (BUFF)
                    }

                    Z00H (Arg1, Arg2)
                    Return (BUFF)
                }

                Method (_WED, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x81))
                    {
                        Return (Z00I ())
                    }
                    Else
                    {
                        If (LEqual (BAEF, 0x01))
                        {
                            If (LOr (LEqual (Arg0, 0x80), LEqual (Arg0, 0x82)))
                            {
                                Return (Z00I ())
                            }
                        }
                    }

                    Return (0xFFFF)
                }

                Method (WMBB, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LNotEqual (Match (Package (0x02)
                                        {
                                            0x01, 
                                            0x02
                                        }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                        {
                            Z00J (Arg1, Arg2)
                            Store (BBSB, BUFF)
                            Return (BUFF)
                        }
                        Else
                        {
                            Store (0x1000, BUFF)
                            Return (BUFF)
                        }

                        Break
                    }
                }

                Method (WMBC, 3, NotSerialized)
                {
                    Z00L (Arg1, Arg2)
                    If (LLess (Arg1, 0x0A))
                    {
                        Subtract (Arg1, 0x01, Local0)
                        Store (DerefOf (Index (BCDS, Subtract (Arg1, 0x01))), BUFF)
                    }
                    Else
                    {
                        ShiftRight (DerefOf (Index (BCDS, Subtract (Arg1, 0x0A))), 0x10, 
                            BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBD, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (Arg2, BUFF)
                            Z00M (BF00)
                            Return (DSY0)
                        }
                        Else
                        {
                            If (LNotEqual (Match (Package (0x02)
                                            {
                                                0x02, 
                                                0x03
                                            }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                            {
                                If (LEqual (Arg1, 0x02))
                                {
                                    Store (Arg2, DY10)
                                }
                                Else
                                {
                                    Store (Arg2, DSY1)
                                }

                                Z00N (Arg1)
                                Return (DSY1)
                            }
                            Else
                            {
                                If (LNotEqual (Match (Package (0x02)
                                                {
                                                    0x04, 
                                                    0x05
                                                }, MEQ, _T_0, MTR, 0x00, 0x00), Ones))
                                {
                                    Z00O (Arg1, Arg2)
                                    Return (BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x07))
                                    {
                                        Store (\_TZ.THRM._TMP (), Local0)
                                        Divide (Local0, 0x0A, , Local0)
                                        Store (Local0, Index (BCDS, 0x0B))
                                        Store (DerefOf (Index (BCDS, 0x0B)), BUFF)
                                        Return (BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x0A))
                                        {
                                            Z00R ()
                                            Return (BUFF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x0B))
                                            {
                                                Store (Arg2, BBAR)
                                                Store (ShiftLeft (And (BBA1, 0x0F), 0x04), Local1)
                                                Or (And (BBA0, 0x0F), Local1, Local1)
                                                Store (Local1, P80H)
                                                Z00K (Local1)
                                                Return (BBPD)
                                            }
                                            Else
                                            {
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Break
                    }
                }

                Method (WMBE, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Z00S (Arg2)
                            Return (BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Z00T (Arg2)
                                Return (BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Z00W (Arg2)
                                    Return (BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x04))
                                    {
                                        Z00V (Arg2)
                                        Return (BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x05))
                                        {
                                            Z00X (Arg2)
                                            Return (BUFF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x06))
                                            {
                                                Z00Y (Arg2)
                                                Return (BUFF)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x07))
                                                {
                                                    Z00Z (Arg2)
                                                    Return (BUFF)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x08))
                                                    {
                                                        Z010 (Arg2)
                                                        Return (BUFF)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x09))
                                                        {
                                                            Z011 (Arg2)
                                                            Return (BUFF)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x0A))
                                                            {
                                                                Z012 (Arg2)
                                                                Return (BUFF)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_0, 0x0B))
                                                                {
                                                                    Z013 (Arg2)
                                                                    Return (BUFF)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_0, 0x11))
                                                                    {
                                                                        Store (\_SB.WMID.PHSR (0x0C, 0x00), BUFF)
                                                                        Return (BUFF)
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_0, 0x12))
                                                                        {
                                                                            Store (\_SB.WMID.PHSR (0x0C, 0x01), BUFF)
                                                                            Return (BUFF)
                                                                        }
                                                                        Else
                                                                        {
                                                                            Store (0x00010000, BUFF)
                                                                            Return (BUFF)
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
                                }
                            }
                        }

                        Break
                    }
                }

                Method (WMBF, 3, NotSerialized)
                {
                    Store (Arg2, BUFF)
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Z014 (BF00)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Z015 (BF00)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Z016 (BF00)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Z018 (BF00)
                                    }
                                    Else
                                    {
                                        Store (0x02, BF00)
                                    }
                                }
                            }
                        }

                        Break
                    }

                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                    Return (BUFF)
                }

                Method (WMBG, 3, NotSerialized)
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)
                        Store (Arg1, _T_0)
                        If (LEqual (_T_0, 0x01))
                        {
                            Store (Arg2, BUFF)
                            Z019 (BF00)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Z01A ()
                            }
                            Else
                            {
                                Store (0x00010000, BUFF)
                            }
                        }

                        Break
                    }

                    Store (0x00, BF01)
                    Store (0x00, BF02)
                    Store (0x00, BF03)
                    Return (BUFF)
                }
            }
        }
    }

    Name (FWSO, "FWSO")
}

