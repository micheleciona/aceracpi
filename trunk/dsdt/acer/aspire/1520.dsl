/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of dsdtDump, Tue May 15 21:27:30 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005E48 (24136)
 *     Revision         0x01
 *     OEM ID           "VIA  "
 *     OEM Table ID     "PTL_ACPI"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("dsdtDump.aml", "DSDT", 1, "VIA  ", "PTL_ACPI", 0x06040000)
{
    Scope (\)
    {
        Name (PICF, 0x00)
        Method (_PIC, 1, NotSerialized)
        {
            Store (Arg0, PICF)
        }
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00004010, 0x06) {}
    }

    Scope (\_SB)
    {
        OperationRegion (PSIB, SystemIO, 0x0000FE00, 0x00000002)
        Field (PSIB, AnyAcc, NoLock, Preserve)
        {
            SMIC,   8
        }

        OperationRegion (PSCB, SystemMemory, 0x3FF7AEBD, 0x00000090)
        Field (PSCB, AnyAcc, NoLock, Preserve)
        {
            BCMD,   8, 
            DID,    32, 
            INF,    1024
        }

        Field (PSCB, AnyAcc, NoLock, Preserve)
        {
                    AccessAs (ByteAcc, 0x00), 
                    Offset (0x05), 
            INF0,   8, 
            INF1,   8, 
            INF2,   8, 
            INF3,   8
        }
    }

    Scope (\_SB)
    {
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x3FF7AEBC, 0x00000001)
        Field (OSTY, AnyAcc, NoLock, Preserve)
        {
            TPOS,   8
        }

        Method (OSTP, 0, NotSerialized)
        {
            If (LEqual (^OSTB, Ones))
            {
                If (CondRefOf (\_OSI, Local0))
                {
                    If (\_OSI ("Windows 2001.1"))
                    {
                        Store (0x20, ^OSTB)
                        Store (0x20, ^TPOS)
                    }
                    Else
                    {
                        If (\_OSI ("Windows 2001 SP1"))
                        {
                            Store (0x10, ^OSTB)
                            Store (0x10, ^TPOS)
                        }
                        Else
                        {
                            If (\_OSI ("Windows 2001"))
                            {
                                Store (0x08, ^OSTB)
                                Store (0x08, ^TPOS)
                            }
                            Else
                            {
                                Store (0x00, ^OSTB)
                                Store (0x00, ^TPOS)
                            }
                        }
                    }
                }
                Else
                {
                    If (CondRefOf (\_OS, Local0))
                    {
                        If (^SEQL (\_OS, "Microsoft Windows"))
                        {
                            Store (0x01, ^OSTB)
                            Store (0x01, ^TPOS)
                        }
                        Else
                        {
                            If (^SEQL (\_OS, "Microsoft WindowsME: Millennium Edition"))
                            {
                                Store (0x02, ^OSTB)
                                Store (0x02, ^TPOS)
                            }
                            Else
                            {
                                If (^SEQL (\_OS, "Microsoft Windows NT"))
                                {
                                    Store (0x04, ^OSTB)
                                    Store (0x04, ^TPOS)
                                }
                                Else
                                {
                                    Store (0x00, ^OSTB)
                                    Store (0x00, ^TPOS)
                                }
                            }
                        }
                    }
                    Else
                    {
                        Store (0x00, ^OSTB)
                        Store (0x00, ^TPOS)
                    }
                }
            }

            Return (^OSTB)
        }

        Method (SEQL, 2, Serialized)
        {
            Store (SizeOf (Arg0), Local0)
            Store (SizeOf (Arg1), Local1)
            If (LNotEqual (Local0, Local1))
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
                If (LNotEqual (Local3, Local4))
                {
                    Return (Zero)
                }

                Increment (Local2)
            }

            Return (One)
        }
    }

    Name (FWSO, "FWSO")
    Name (_PSC, 0x00)
    Method (_PS0, 0, NotSerialized)
    {
        Store (_PSC, Local0)
        Store (0x00, _PSC)
        If (LEqual (Local0, 0x03))
        {
            Store (0x01, \_SB.INF)
            While (\_SB.INF)
            {
                Store (0x20, \_SB.BCMD)
                Store (Zero, \_SB.SMIC)
                If (LAnd (LEqual (\_SB.INF, 0x01), LGreaterEqual (\_SB.OSTB, 0x04)))
                {
                    Sleep (0x01F4)
                }
            }
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        Store (0x03, _PSC)
    }

    Name (_S0, Package (0x02)
    {
        0x00, 
        0x00
    })
    Name (_S3, Package (0x02)
    {
        0x01, 
        0x01
    })
    Name (_S4, Package (0x02)
    {
        0x02, 
        0x02
    })
    Name (_S5, Package (0x02)
    {
        0x02, 
        0x02
    })
    Method (\_PTS, 1, NotSerialized)
    {
        Store (Zero, \_SB.PCI0.LPCB.STRP)
        Store (0x86, \_SB.BCMD)
        Store (Zero, \_SB.SMIC)
        If (LEqual (Arg0, 0x03))
        {
            Store (0x08, \_SB.PCI0.LPCB.EC.P50S)
            Store (0x08, \_SB.PCI0.LPCB.EC.P60S)
            Store (0x08, \_SB.PCI0.LPCB.EC.P63S)
            Store (0x08, \_SB.PCI0.LPCB.EC.P64S)
            Store (0x08, \_SB.PCI0.LPCB.EC.P65S)
            Store (0x08, \_SB.PCI0.LPCB.EC.P66S)
            Store (Zero, \_SB.PCI0.LPCB.GPSU)
            Store (One, \_SB.PCI0.LPCB.STRP)
            Store (0x00, \_SB.PCI0.LPCB.GPBL)
            Store (0x80, \_SB.BCMD)
            Store (Zero, \_SB.SMIC)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (Zero, \_SB.PCI0.LPCB.GPSU)
            Store (One, \_SB.PCI0.LPCB.STRP)
            Store (0x01, \_SB.PCI0.LPCB.GPBL)
            Store (0x91, \_SB.BCMD)
            Store (Zero, \_SB.SMIC)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x92, \_SB.BCMD)
            Store (Zero, \_SB.SMIC)
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        Store (Arg0, \_SB.PCI0.LPCB.P80H)
        If (LEqual (Arg0, 0x03))
        {
            Store (0x88, \_SB.PCI0.LPCB.EC.P54S)
            Store (0x82, \_SB.PCI0.LPCB.EC.P54T)
            Store (0x91, \_SB.PCI0.LPCB.EC.P55S)
            Store (0x81, \_SB.PCI0.LPCB.EC.P55T)
            Store (0x87, \_SB.BCMD)
            Store (Zero, \_SB.SMIC)
            If (LEqual (\_SB.INF0, 0x01))
            {
                Notify (\_SB.SLPB, 0x02)
            }
            Else
            {
                Store (0x00, \_SB.INF0)
            }

            Store (0x96, \_SB.BCMD)
            Store (Zero, \_SB.SMIC)
            Store (0x88, \_SB.PCI0.LPCB.EC.P50S)
            Store (0x88, \_SB.PCI0.LPCB.EC.P60S)
            Store (0x88, \_SB.PCI0.LPCB.EC.P63S)
            Store (0x88, \_SB.PCI0.LPCB.EC.P64S)
            Store (0x88, \_SB.PCI0.LPCB.EC.P65S)
            Store (0x88, \_SB.PCI0.LPCB.EC.P66S)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x9B, \_SB.BCMD)
            Store (Zero, \_SB.SMIC)
        }

        Store (0x81, \_SB.BCMD)
        Store (Zero, \_SB.SMIC)
    }

    Scope (\_GPE)
    {
        Method (_L00, 0, NotSerialized)
        {
            Notify (\_SB.SLPB, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
        }
    }

    Scope (_TZ)
    {
        Name (T4FG, 0x00)
        Name (SBFG, 0x00)
        Name (CBFG, 0x00)
        Name (TBSE, 0x0AAC)
        Name (DCRT, 0x0DCC)
        ThermalZone (THRS)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Store ("SYST of _TMP =", Debug)
                If (LEqual (T4FG, 0x01))
                {
                    Store (0x01, SBFG)
                    Store (0x50, Local0)
                    Return (Add (Multiply (Local0, 0x0A), TBSE))
                }
                Else
                {
                    Store (0x88, \_SB.BCMD)
                    Store (Zero, \_SB.SMIC)
                    Store (\_SB.INF1, Local0)
                    And (Local0, 0x80, Local1)
                    If (LEqual (Local1, 0x80))
                    {
                        Store (0x1E, Local0)
                    }
                    Else
                    {
                        If (LLessEqual (Local0, 0x10))
                        {
                            Store (0x11, Local0)
                        }
                    }

                    If (LEqual (SBFG, 0x00))
                    {
                        Store (0x8A, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF1, Local1)
                        If (LLessEqual (Local1, Local0))
                        {
                            Store (0x01, T4FG)
                        }

                        Store (0x01, SBFG)
                    }

                    Return (Add (Multiply (Local0, 0x0A), TBSE))
                }
            }

            Method (_CRT, 0, NotSerialized)
            {
                Store ("SYS T5 _CRT =", Debug)
                Store (0x8C, \_SB.BCMD)
                Store (Zero, \_SB.SMIC)
                Store (\_SB.INF1, Local0)
                Return (Add (Multiply (Local0, 0x0A), TBSE))
            }

            Method (_SCP, 1, NotSerialized)
            {
                Store ("_SCP", Debug)
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Method (_PSV, 0, NotSerialized)
            {
                Store ("SYS T4 _CRT =", Debug)
                Store (0x8A, \_SB.BCMD)
                Store (Zero, \_SB.SMIC)
                Store (\_SB.INF1, Local0)
                Return (Add (Multiply (Local0, 0x0A), TBSE))
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x05)
            Name (_TSP, 0x012C)
        }

        ThermalZone (THRC)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Store ("CPU _TMP =", Debug)
                If (LEqual (T4FG, 0x01))
                {
                    Store (0x01, CBFG)
                    Store (0x5F, Local0)
                    Return (Add (Multiply (Local0, 0x0A), TBSE))
                }
                Else
                {
                    Store (0x89, \_SB.BCMD)
                    Store (Zero, \_SB.SMIC)
                    Store (\_SB.INF2, Local0)
                    And (Local0, 0x80, Local1)
                    If (LEqual (Local1, 0x80))
                    {
                        Store (0x1E, Local0)
                    }
                    Else
                    {
                        If (LLessEqual (Local0, 0x10))
                        {
                            Store (0x11, Local0)
                        }
                    }

                    If (LEqual (CBFG, 0x00))
                    {
                        Store (0x8B, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF2, Local1)
                        If (LLessEqual (Local1, Local0))
                        {
                            Store (0x01, T4FG)
                        }

                        Store (0x01, CBFG)
                    }

                    Return (Add (Multiply (Local0, 0x0A), TBSE))
                }
            }

            Method (_CRT, 0, NotSerialized)
            {
                Store ("CPU T5 _CRT =", Debug)
                Store (0x8D, \_SB.BCMD)
                Store (Zero, \_SB.SMIC)
                Store (\_SB.INF2, Local0)
                Store (Local0, Debug)
                Return (Add (Multiply (Local0, 0x0A), TBSE))
            }

            Method (_SCP, 1, NotSerialized)
            {
                Store ("_SCP", Debug)
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Method (_PSV, 0, NotSerialized)
            {
                Store ("CPU T4 _CRT =", Debug)
                Store (0x8B, \_SB.BCMD)
                Store (Zero, \_SB.SMIC)
                Store (\_SB.INF2, Local0)
                Return (Add (Multiply (Local0, 0x0A), TBSE))
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x05)
            Name (_TSP, 0x012C)
        }
    }

    Scope (\_SB)
    {
        Mutex (VSMX, 0x00)
        Method (Z000, 1, Serialized)
        {
            Store ("--------- VIA SOFTWARE SMI PMIO 2Fh ------------", Debug)
            Acquire (VSMX, 0xFFFF)
            Store (Arg0, \_SB.PCI0.LPCB.BCMD)
            Release (VSMX)
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_BBN, 0x00)
            Name (CRES, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    0x00,, , TypeStatic)
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    0x00,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (CRES, \_SB.PCI0._Y00._MIN, TCMN)
                CreateDWordField (CRES, \_SB.PCI0._Y00._MAX, TCMX)
                CreateDWordField (CRES, \_SB.PCI0._Y00._LEN, TOLN)
                Multiply (\_SB.PCI0.NBF3.EADD, 0x01000000, TCMN)
                Subtract (0xFFE80000, TCMN, TOLN)
                Subtract (Add (TCMN, TOLN), 0x01, TCMX)
                CreateBitField (CRES, \_SB.PCI0._Y01._RW, C0RW)
                CreateDWordField (CRES, \_SB.PCI0._Y01._MIN, C0MN)
                CreateDWordField (CRES, \_SB.PCI0._Y01._MAX, C0MX)
                CreateDWordField (CRES, \_SB.PCI0._Y01._LEN, C0LN)
                Store (One, C0RW)
                If (LEqual (And (\_SB.PCI0.NBF3.C0C3, 0x03), 0x01))
                {
                    Store (Zero, C0RW)
                }

                Store (Zero, C0LN)
                If (LNot (And (\_SB.PCI0.NBF3.C0C3, 0x03)))
                {
                    Store (0x4000, C0LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y02._RW, C4RW)
                CreateDWordField (CRES, \_SB.PCI0._Y02._MIN, C4MN)
                CreateDWordField (CRES, \_SB.PCI0._Y02._MAX, C4MX)
                CreateDWordField (CRES, \_SB.PCI0._Y02._LEN, C4LN)
                Store (One, C4RW)
                If (LEqual (And (\_SB.PCI0.NBF3.C4C7, 0x03), 0x01))
                {
                    Store (Zero, C4RW)
                }

                Store (Zero, C4LN)
                If (LNot (And (\_SB.PCI0.NBF3.C4C7, 0x03)))
                {
                    Store (0x4000, C4LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y03._RW, C8RW)
                CreateDWordField (CRES, \_SB.PCI0._Y03._MIN, C8MN)
                CreateDWordField (CRES, \_SB.PCI0._Y03._MAX, C8MX)
                CreateDWordField (CRES, \_SB.PCI0._Y03._LEN, C8LN)
                Store (One, C8RW)
                If (LEqual (And (\_SB.PCI0.NBF3.C8CB, 0x03), 0x01))
                {
                    Store (Zero, C8RW)
                }

                Store (Zero, C8LN)
                If (LNot (And (\_SB.PCI0.NBF3.C8CB, 0x03)))
                {
                    Store (0x4000, C8LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y04._RW, CCRW)
                CreateDWordField (CRES, \_SB.PCI0._Y04._MIN, CCMN)
                CreateDWordField (CRES, \_SB.PCI0._Y04._MAX, CCMX)
                CreateDWordField (CRES, \_SB.PCI0._Y04._LEN, CCLN)
                Store (One, CCRW)
                If (LEqual (And (\_SB.PCI0.NBF3.CCCF, 0x03), 0x01))
                {
                    Store (Zero, CCRW)
                }

                Store (Zero, CCLN)
                If (LNot (And (\_SB.PCI0.NBF3.CCCF, 0x03)))
                {
                    Store (0x4000, CCLN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y05._RW, D0RW)
                CreateDWordField (CRES, \_SB.PCI0._Y05._MIN, D0MN)
                CreateDWordField (CRES, \_SB.PCI0._Y05._MAX, D0MX)
                CreateDWordField (CRES, \_SB.PCI0._Y05._LEN, D0LN)
                Store (One, D0RW)
                If (LEqual (And (\_SB.PCI0.NBF3.D0D3, 0x03), 0x01))
                {
                    Store (Zero, D0RW)
                }

                Store (Zero, D0LN)
                If (LNot (And (\_SB.PCI0.NBF3.D0D3, 0x03)))
                {
                    Store (0x4000, D0LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y06._RW, D4RW)
                CreateDWordField (CRES, \_SB.PCI0._Y06._MIN, D4MN)
                CreateDWordField (CRES, \_SB.PCI0._Y06._MAX, D4MX)
                CreateDWordField (CRES, \_SB.PCI0._Y06._LEN, D4LN)
                Store (One, D4RW)
                If (LEqual (And (\_SB.PCI0.NBF3.D4D7, 0x03), 0x01))
                {
                    Store (Zero, D4RW)
                }

                Store (Zero, D4LN)
                If (LNot (And (\_SB.PCI0.NBF3.D4D7, 0x03)))
                {
                    Store (0x4000, D4LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y07._RW, D8RW)
                CreateDWordField (CRES, \_SB.PCI0._Y07._MIN, D8MN)
                CreateDWordField (CRES, \_SB.PCI0._Y07._MAX, D8MX)
                CreateDWordField (CRES, \_SB.PCI0._Y07._LEN, D8LN)
                Store (One, D8RW)
                If (LEqual (And (\_SB.PCI0.NBF3.D8DB, 0x03), 0x01))
                {
                    Store (Zero, D8RW)
                }

                Store (Zero, D8LN)
                If (LNot (And (\_SB.PCI0.NBF3.D8DB, 0x03)))
                {
                    Store (0x4000, D8LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y08._RW, DCRW)
                CreateDWordField (CRES, \_SB.PCI0._Y08._MIN, DCMN)
                CreateDWordField (CRES, \_SB.PCI0._Y08._MAX, DCMX)
                CreateDWordField (CRES, \_SB.PCI0._Y08._LEN, DCLN)
                Store (One, DCRW)
                If (LEqual (And (\_SB.PCI0.NBF3.DCDF, 0x03), 0x01))
                {
                    Store (Zero, DCRW)
                }

                Store (Zero, DCLN)
                If (LNot (And (\_SB.PCI0.NBF3.DCDF, 0x03)))
                {
                    Store (0x4000, DCLN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y09._RW, E0RW)
                CreateDWordField (CRES, \_SB.PCI0._Y09._MIN, E0MN)
                CreateDWordField (CRES, \_SB.PCI0._Y09._MAX, E0MX)
                CreateDWordField (CRES, \_SB.PCI0._Y09._LEN, E0LN)
                Store (One, E0RW)
                If (LEqual (And (\_SB.PCI0.NBF3.E0EF, 0x03), 0x01))
                {
                    Store (Zero, E0RW)
                }

                Store (Zero, E0LN)
                If (LNot (And (\_SB.PCI0.NBF3.E0EF, 0x03)))
                {
                    Store (0x00010000, E0LN)
                }

                CreateBitField (CRES, \_SB.PCI0._Y0A._RW, F0RW)
                CreateDWordField (CRES, \_SB.PCI0._Y0A._MIN, F0MN)
                CreateDWordField (CRES, \_SB.PCI0._Y0A._MAX, F0MX)
                CreateDWordField (CRES, \_SB.PCI0._Y0A._LEN, F0LN)
                Store (One, F0RW)
                If (LEqual (And (\_SB.PCI0.NBF3.F0FF, 0x03), 0x01))
                {
                    Store (Zero, F0RW)
                }

                Store (Zero, F0LN)
                If (LNot (And (\_SB.PCI0.NBF3.F0FF, 0x03)))
                {
                    Store (0x00010000, F0LN)
                }

                Return (CRES)
            }

            Device (NBF3)
            {
                Name (_ADR, 0x03)
                OperationRegion (NBF3, PCI_Config, 0x00, 0x0100)
                Field (NBF3, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x47), 
                    EADD,   8, 
                            Offset (0x80), 
                    C0C3,   2, 
                    C4C7,   2, 
                    C8CB,   2, 
                    CCCF,   2, 
                    D0D3,   2, 
                    D4D7,   2, 
                    D8DB,   2, 
                    DCDF,   2, 
                        ,   4, 
                    E0EF,   2, 
                    F0FF,   2
                }
            }

            Device (NBF7)
            {
                Name (_ADR, 0x07)
                OperationRegion (NBF7, PCI_Config, 0x00, 0x0100)
                Field (NBF7, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x47), 
                        ,   2, 
                    VLNK,   1
                }
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)
                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Name (SWIT, 0x01)
                    Name (CRTA, 0x01)
                    Name (LCDA, 0x01)
                    Name (TVAF, 0x00)
                    Name (TOGF, 0x00)
                    Name (OSF, 0x00)
                    Method (_INI, 0, NotSerialized)
                    {
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (Arg0, Local0)
                        And (Local0, 0x01, Local1)
                        Store (Local1, SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010200, 
                            0x00010110
                        })
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (TVO)
                    {
                        Name (_ADR, 0x0200)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (TVAF)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (TVAF)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }

                        Method (_DDC, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (\_SB.PCI0.AGP.VGA.DDC3)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.AGP.VGA.DDC3, \_SB.PCI0.AGP.VGA.DDC0, Local0)
                                Return (Local0)
                            }

                            Return (0x00)
                        }
                    }

                    Name (DDC0, Buffer (0x80)
                    {
                        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0060 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    })
                    Name (DDC3, Buffer (0x80)
                    {
                        /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                        /* 0008 */    0x41, 0xD0, 0xFE, 0x09, 0x00, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0018 */    0xF0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0020 */    0x00, 0x00, 0x00, 0x21, 0x08, 0x00, 0x00, 0x00, 
                        /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0060 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD3
                    })
                    Name (DDC4, Buffer (0x80)
                    {
                        /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                        /* 0008 */    0x0D, 0xAF, 0x00, 0x15, 0x00, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x02, 0x0D, 0x01, 0x03, 0x80, 0x21, 0x15, 0x78, 
                        /* 0018 */    0x0A, 0xCA, 0xA5, 0x95, 0x5B, 0x4C, 0x95, 0x27, 
                        /* 0020 */    0x22, 0x50, 0x54, 0x00, 0x00, 0x00, 0x01, 0x01, 
                        /* 0028 */    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 
                        /* 0030 */    0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xBC, 0x1B, 
                        /* 0038 */    0x00, 0xA0, 0x50, 0x20, 0x17, 0x30, 0x30, 0x20, 
                        /* 0040 */    0x26, 0x00, 0x4B, 0xCF, 0x10, 0x00, 0x00, 0x1C, 
                        /* 0048 */    0x00, 0x00, 0x00, 0xFD, 0x00, 0x3B, 0x3D, 0x30, 
                        /* 0050 */    0x32, 0x08, 0x00, 0x0A, 0x20, 0x20, 0x20, 0x20, 
                        /* 0058 */    0x20, 0x20, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x4E, 
                        /* 0060 */    0x31, 0x35, 0x34, 0x49, 0x31, 0x0A, 0x20, 0x20, 
                        /* 0068 */    0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFC, 
                        /* 0070 */    0x00, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x20, 0x4C, 
                        /* 0078 */    0x43, 0x44, 0x0A, 0x20, 0x20, 0x20, 0x00, 0x98
                    })
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x05, 
                0x05
            })
            Method (_S3D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Method (_INI, 0, NotSerialized)
            {
                \_SB.OSTP ()
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (PICF)
                {
                    Return (APIC)
                }
                Else
                {
                    Return (PICM)
                }
            }

            Name (APIC, Package (0x11)
            {
                Package (0x04)
                {
                    0x0018FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x01, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x02, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x03, 
                    0x00, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x01, 
                    0x00, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x02, 
                    0x00, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    0x00, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x00, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x01, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x02, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x03, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    0x00, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    0x00, 
                    0x00, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x00, 
                    0x00, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x00, 
                    0x00, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x01, 
                    0x00, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x02, 
                    0x00, 
                    0x13
                }
            })
            Name (PICM, Package (0x20)
            {
                Package (0x04)
                {
                    0x0018FFFF, 
                    0x00, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x01, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x02, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x03, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    \_SB.PCI0.LPCB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    \_SB.PCI0.LPCB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    \_SB.PCI0.LPCB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x00, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x01, 
                    \_SB.PCI0.LPCB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x02, 
                    \_SB.PCI0.LPCB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x03, 
                    \_SB.PCI0.LPCB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x00, 
                    \_SB.PCI0.LPCB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x01, 
                    \_SB.PCI0.LPCB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x02, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x03, 
                    \_SB.PCI0.LPCB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x00, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x01, 
                    \_SB.PCI0.LPCB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    \_SB.PCI0.LPCB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x03, 
                    \_SB.PCI0.LPCB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x00, 
                    \_SB.PCI0.LPCB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x01, 
                    \_SB.PCI0.LPCB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x02, 
                    \_SB.PCI0.LPCB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x03, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    \_SB.PCI0.LPCB.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x01, 
                    \_SB.PCI0.LPCB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x02, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x03, 
                    \_SB.PCI0.LPCB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x00, 
                    \_SB.PCI0.LPCB.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x01, 
                    \_SB.PCI0.LPCB.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x02, 
                    \_SB.PCI0.LPCB.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x03, 
                    \_SB.PCI0.LPCB.LNKC, 
                    0x00
                }
            })
            Device (LPCB)
            {
                Name (_ADR, 0x00110000)
                OperationRegion (LPC0, PCI_Config, 0x00, 0x0100)
                Field (LPC0, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x50), 
                        ,   1, 
                    ESB4,   1, 
                    ESB3,   1, 
                        ,   1, 
                    ESB1,   1, 
                    ESB2,   1, 
                    AC97,   1, 
                    MC97,   1, 
                        ,   2, 
                    PS2E,   1, 
                        ,   1, 
                    ILAN,   1, 
                            Offset (0x55), 
                        ,   4, 
                    PIRA,   4, 
                    PIRB,   4, 
                    PIRC,   4, 
                        ,   4, 
                    PIRD,   4, 
                            Offset (0x88), 
                    PMBS,   16, 
                            Offset (0x94), 
                    GPBL,   2, 
                        ,   2, 
                    GPSU,   1, 
                    SUSC,   1, 
                    STRP,   1, 
                            Offset (0x95), 
                    USBW,   1, 
                            Offset (0xD0), 
                    SMBS,   16, 
                    SMBC,   1
                }

                OperationRegion (PMIO, SystemIO, 0x4000, 0x50)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x2A), 
                    PACT,   1, 
                            Offset (0x2F), 
                    BCMD,   8, 
                        ,   5, 
                    CMAS,   1, 
                    CMBS,   1, 
                            Offset (0x31), 
                            Offset (0x34), 
                        ,   5, 
                    CMAE,   1, 
                    CMBE,   1
                }

                OperationRegion (Z001, SystemIO, 0x80, 0x01)
                Field (Z001, ByteAcc, NoLock, Preserve)
                {
                    P80H,   8
                }

                Device (ALKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Name (_PRS, ResourceTemplate ()
                    {
                        Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                        {
                            0x00000010,
                            0x00000011,
                            0x00000012,
                            0x00000013,
                            0x00000014,
                            0x00000015,
                            0x00000016,
                            0x00000017,
                        }
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (PIRA, 0xF0, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (PIRA, 0x0F, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFA, ResourceTemplate ()
                        {
                            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y0B)
                            {
                                0x00000000,
                            }
                        })
                        CreateWordField (BUFA, \_SB.PCI0.LPCB.ALKA._CRS._Y0B._INT, IRAI)
                        Store (\_SB.PCI0.LPCB.PIRA, IRAI)
                        Return (BUFA)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                    }
                }

                Device (ALKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Name (_PRS, ResourceTemplate ()
                    {
                        Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                        {
                            0x00000010,
                            0x00000011,
                            0x00000012,
                            0x00000013,
                            0x00000014,
                            0x00000015,
                            0x00000016,
                            0x00000017,
                        }
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (PIRB, 0xF0, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (PIRB, 0x0F, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFB, ResourceTemplate ()
                        {
                            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y0C)
                            {
                                0x00000000,
                            }
                        })
                        CreateWordField (BUFB, \_SB.PCI0.LPCB.ALKB._CRS._Y0C._INT, IRBI)
                        Store (\_SB.PCI0.LPCB.PIRB, IRBI)
                        Return (BUFB)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                    }
                }

                Device (ALKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Name (_PRS, ResourceTemplate ()
                    {
                        Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                        {
                            0x00000016,
                        }
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (PIRC, 0xF0, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (PIRC, 0x0F, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFC, ResourceTemplate ()
                        {
                            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y0D)
                            {
                                0x00000000,
                            }
                        })
                        CreateWordField (BUFC, \_SB.PCI0.LPCB.ALKC._CRS._Y0D._INT, IRCI)
                        Store (\_SB.PCI0.LPCB.PIRC, IRCI)
                        Return (BUFC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                    }
                }

                Device (ALKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Name (_PRS, ResourceTemplate ()
                    {
                        Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                        {
                            0x00000015,
                        }
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (PIRD, 0xF0, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (PIRD, 0x0F, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFD, ResourceTemplate ()
                        {
                            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y0E)
                            {
                                0x00000000,
                            }
                        })
                        CreateWordField (BUFD, \_SB.PCI0.LPCB.ALKD._CRS._Y0E._INT, IRDI)
                        Store (\_SB.PCI0.LPCB.PIRD, IRDI)
                        Return (BUFD)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                    }
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,12,14,15}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (Zero, \_SB.PCI0.LPCB.PIRA)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.LPCB.PIRA, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0F)
                                {}
                        })
                        CreateByteField (BUFA, \_SB.PCI0.LPCB.LNKA._CRS._Y0F._INT, IRA1)
                        CreateByteField (BUFA, 0x02, IRA2)
                        Store (\_SB.PCI0.LPCB.PIRA, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            If (LGreater (Local0, 0x07))
                            {
                                Subtract (Local0, 0x08, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRA2)
                            }
                            Else
                            {
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRA1)
                            }
                        }

                        Return (BUFA)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x01, IRA1)
                        CreateByteField (Arg0, 0x02, IRA2)
                        If (LGreater (IRA2, Zero))
                        {
                            FindSetLeftBit (IRA2, Local0)
                            Decrement (Local0)
                            Add (Local0, 0x08, Local0)
                        }
                        Else
                        {
                            FindSetLeftBit (IRA1, Local0)
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.LPCB.PIRA)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,10,12,14,15}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (Zero, \_SB.PCI0.LPCB.PIRB)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.LPCB.PIRB, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y10)
                                {}
                        })
                        CreateByteField (BUFB, \_SB.PCI0.LPCB.LNKB._CRS._Y10._INT, IRB1)
                        CreateByteField (BUFB, 0x02, IRB2)
                        Store (\_SB.PCI0.LPCB.PIRB, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            If (LGreater (Local0, 0x07))
                            {
                                Subtract (Local0, 0x08, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRB2)
                            }
                            Else
                            {
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRB1)
                            }
                        }

                        Return (BUFB)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x01, IRB1)
                        CreateByteField (Arg0, 0x02, IRB2)
                        If (LGreater (IRB2, Zero))
                        {
                            FindSetLeftBit (IRB2, Local0)
                            Decrement (Local0)
                            Add (Local0, 0x08, Local0)
                        }
                        Else
                        {
                            FindSetLeftBit (IRB1, Local0)
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.LPCB.PIRB)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,11,12,14,15}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (Zero, \_SB.PCI0.LPCB.PIRC)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.LPCB.PIRC, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y11)
                                {}
                        })
                        CreateByteField (BUFC, \_SB.PCI0.LPCB.LNKC._CRS._Y11._INT, IRC1)
                        CreateByteField (BUFC, 0x02, IRC2)
                        Store (\_SB.PCI0.LPCB.PIRC, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            If (LGreater (Local0, 0x07))
                            {
                                Subtract (Local0, 0x08, Local0)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRC2)
                            }
                            Else
                            {
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, IRC1)
                            }
                        }

                        Return (BUFC)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x01, IRC1)
                        CreateByteField (Arg0, 0x02, IRC2)
                        If (LGreater (IRC2, Zero))
                        {
                            FindSetLeftBit (IRC2, Local0)
                            Decrement (Local0)
                            Add (Local0, 0x08, Local0)
                        }
                        Else
                        {
                            FindSetLeftBit (IRC1, Local0)
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.LPCB.PIRC)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {3,4,5,7,9,10,11,12,14,15}
                    })
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (Zero, \_SB.PCI0.LPCB.PIRD)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.LPCB.PIRD, 0x00))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y12)
                                {}
                        })
                        CreateByteField (BUFD, \_SB.PCI0.LPCB.LNKD._CRS._Y12._INT, IRD1)
                        CreateByteField (BUFD, 0x02, IRD2)
                        Store (\_SB.PCI0.LPCB.PIRD, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            If (LGreater (Local0, 0x07))
                            {
                                Subtract (Local0, 0x08, Local2)
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local2, Local3)
                                Store (Local3, IRD2)
                            }
                            Else
                            {
                                Store (0x01, Local1)
                                ShiftLeft (Local1, Local0, Local2)
                                Store (Local2, IRD1)
                            }
                        }

                        Return (BUFD)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x01, IRD1)
                        CreateByteField (Arg0, 0x02, IRD2)
                        If (LGreater (IRD2, Zero))
                        {
                            FindSetLeftBit (IRD2, Local0)
                            Decrement (Local0)
                            Add (Local0, 0x08, Local0)
                        }
                        Else
                        {
                            FindSetLeftBit (IRD1, Local0)
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.LPCB.PIRD)
                    }
                }

                Device (DMA1)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode10,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x06,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (SPKR)
                {
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

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

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (SMEM, ResourceTemplate ()
                        {
                            Memory32Fixed (ReadOnly,
                                0x000E0000,         // Address Base
                                0x00020000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0xFFF00000,         // Address Base
                                0x00100000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0xFFEE0000,         // Address Base
                                0x00020000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0xFEC00000,         // Address Base
                                0x00001000,         // Address Length
                                )
                            Memory32Fixed (ReadOnly,
                                0xFEE00000,         // Address Base
                                0x00001000,         // Address Length
                                )
                        })
                        Return (SMEM)
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.LPCB.SMBC)
                        {
                            Name (RSR2, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x002E,             // Range Minimum
                                    0x002E,             // Range Maximum
                                    0x01,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x0092,             // Range Minimum
                                    0x0092,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x0600,             // Range Minimum
                                    0x0600,             // Range Maximum
                                    0x01,               // Alignment
                                    0x10,               // Length
                                    )
                                IO (Decode16,
                                    0x00A8,             // Range Minimum
                                    0x00A8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0x01C0,             // Range Minimum
                                    0x01C0,             // Range Maximum
                                    0x01,               // Alignment
                                    0x10,               // Length
                                    )
                                IO (Decode16,
                                    0x0080,             // Range Minimum
                                    0x0080,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x04D0,             // Range Minimum
                                    0x04D0,             // Range Maximum
                                    0x01,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0xFE10,             // Range Minimum
                                    0xFE10,             // Range Maximum
                                    0x01,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0xFE00,             // Range Minimum
                                    0xFE00,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x8000,             // Range Minimum
                                    0x8000,             // Range Maximum
                                    0x01,               // Alignment
                                    0x80,               // Length
                                    _Y13)
                                IO (Decode16,
                                    0x8100,             // Range Minimum
                                    0x8100,             // Range Maximum
                                    0x01,               // Alignment
                                    0x20,               // Length
                                    _Y14)
                                Memory32Fixed (ReadOnly,
                                    0xFEC00000,         // Address Base
                                    0x00001000,         // Address Length
                                    )
                                Memory32Fixed (ReadOnly,
                                    0xFEE00000,         // Address Base
                                    0x00001000,         // Address Length
                                    )
                            })
                            CreateWordField (RSR2, \_SB.PCI0.LPCB.SYSR._CRS._Y13._MIN, PMMI)
                            CreateWordField (RSR2, \_SB.PCI0.LPCB.SYSR._CRS._Y13._MAX, PMMA)
                            CreateWordField (RSR2, \_SB.PCI0.LPCB.SYSR._CRS._Y14._MIN, SMMI)
                            CreateWordField (RSR2, \_SB.PCI0.LPCB.SYSR._CRS._Y14._MAX, SMMA)
                            And (\_SB.PCI0.LPCB.PMBS, 0xFFFE, PMMI)
                            Store (PMMI, PMMA)
                            And (\_SB.PCI0.LPCB.SMBS, 0xFFF0, SMMI)
                            Store (SMMI, SMMA)
                            Return (RSR2)
                        }
                        Else
                        {
                            Name (RSR1, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0080,             // Range Minimum
                                    0x0080,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x04D0,             // Range Minimum
                                    0x04D0,             // Range Maximum
                                    0x01,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0xFE10,             // Range Minimum
                                    0xFE10,             // Range Maximum
                                    0x01,               // Alignment
                                    0x02,               // Length
                                    )
                                IO (Decode16,
                                    0xFE00,             // Range Minimum
                                    0xFE00,             // Range Maximum
                                    0x01,               // Alignment
                                    0x01,               // Length
                                    )
                                IO (Decode16,
                                    0x8000,             // Range Minimum
                                    0x8000,             // Range Maximum
                                    0x01,               // Alignment
                                    0x80,               // Length
                                    _Y15)
                            })
                            CreateWordField (RSR1, \_SB.PCI0.LPCB.SYSR._CRS._Y15._MIN, IOMI)
                            CreateWordField (RSR1, \_SB.PCI0.LPCB.SYSR._CRS._Y15._MAX, IOMA)
                            And (\_SB.PCI0.LPCB.PMBS, 0xFFFE, IOMI)
                            Store (IOMI, IOMA)
                            Return (RSR1)
                        }
                    }
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("SYN0302"))
                    Name (_CID, Package (0x02)
                    {
                        0x00032E4F, 
                        0x130FD041
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                }

                Device (PS2K)
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
                        IRQNoFlags ()
                            {1}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x0B)
                    Name (ECOK, 0x00)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECOK)
                        }
                    }

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
                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0x7F)
                    Field (ERAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x01), 
                        SCIC,   8, 
                                Offset (0x04), 
                        CMCD,   8, 
                        DAT1,   8, 
                        DAT2,   8, 
                        DAT3,   8, 
                                Offset (0x18), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   264, 
                        SMAA,   8, 
                                Offset (0x43), 
                        P50,    1, 
                            ,   2, 
                        P43,    1, 
                        P54,    1, 
                        P55,    1, 
                                Offset (0x44), 
                                Offset (0x48), 
                        P54S,   8, 
                        P55S,   8, 
                        P50S,   8, 
                        P43S,   8, 
                        P54T,   8, 
                        P55T,   8, 
                        P50T,   8, 
                        P43T,   8, 
                        P60S,   8, 
                        P61S,   8, 
                        P62S,   8, 
                        P63S,   8, 
                        P64S,   8, 
                        P65S,   8, 
                        P66S,   8, 
                        P67S,   8, 
                                Offset (0x5F), 
                        P67T,   8, 
                                Offset (0x78), 
                        P60,    1, 
                        P61,    1, 
                        P62,    1, 
                        P63,    1, 
                        P64,    1, 
                        P65,    1, 
                        P66,    1, 
                        P67,    1
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

                    OperationRegion (EC01, SystemIO, 0x62, 0x01)
                    Field (EC01, ByteAcc, Lock, Preserve)
                    {
                        PX62,   8
                    }

                    OperationRegion (EC02, SystemIO, 0x66, 0x01)
                    Field (EC02, ByteAcc, Lock, Preserve)
                    {
                        PX66,   8
                    }

                    Mutex (MUT0, 0x00)
                    Mutex (MUT1, 0x00)
                    Method (RAMR, 2, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        If (LGreater (Arg0, 0x7F))
                        {
                            Store (Arg1, DAT3)
                        }

                        Store (Arg0, DAT2)
                        Store (0xBA, CMCD)
                        Store (0x64, Local1)
                        While (Local1)
                        {
                            Decrement (Local1)
                            Sleep (0x05)
                            Store (CMCD, Local0)
                            If (LEqual (Local0, Zero))
                            {
                                Store (Zero, Local1)
                            }
                        }

                        Store (DAT1, Local0)
                        Release (VSMX)
                        Return (Local0)
                    }

                    Method (RAMW, 3, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        If (LGreater (Arg0, 0x7F))
                        {
                            Store (Arg2, DAT3)
                        }

                        Store (Arg0, DAT2)
                        Store (Arg1, DAT1)
                        Store (0xBB, CMCD)
                        Store (0x64, Local1)
                        While (Local1)
                        {
                            Decrement (Local1)
                            Sleep (0x05)
                            Store (CMCD, Local0)
                            If (LEqual (Local0, Zero))
                            {
                                Store (Zero, Local1)
                            }
                        }

                        Release (VSMX)
                    }

                    Method (COMD, 2, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        Store (Arg1, DAT1)
                        Store (Arg0, CMCD)
                        Store (0x64, Local1)
                        While (Local1)
                        {
                            Decrement (Local1)
                            Sleep (0x05)
                            Store (CMCD, Local0)
                            If (LEqual (Local0, Zero))
                            {
                                Store (Zero, Local1)
                            }
                        }

                        Store (DAT1, Local0)
                        Release (VSMX)
                        Return (Local0)
                    }

                    Method (SMRD, 4, NotSerialized)
                    {
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
                        Store (0x03, Local0)
                        While (LGreater (Local0, 0x01))
                        {
                            And (SMST, 0x40, SMST)
                            Store (Arg2, SMCM)
                            Store (Arg1, SMAD)
                            Store (Arg0, SMPR)
                            Store ("Write to EC:SMCM,SMAD,SMPR", Debug)
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
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
                                Store (SMD0, Arg3)
                            }
                        }

                        Release (MUT0)
                        Return (Local0)
                    }

                    Method (SMWR, 4, NotSerialized)
                    {
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
                        Store (0x03, Local0)
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
                            While (LNot (And (SMST, 0xBF, Local1)))
                            {
                                Sleep (0x02)
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

                    Method (_Q09, 0, NotSerialized)
                    {
                        Notify (\_SB.BAT0, 0x80)
                    }

                    Method (_Q0A, 0, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x01, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x25, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xA5, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q0B, 0, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x6A, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x26, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xA6, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q0C, 0, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x03, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x27, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xA7, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        Store (0x83, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Notify (\_SB.SLPB, 0x80)
                        }
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x5F, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xDF, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x05, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x29, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xA9, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        Store (0x93, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01)) {}
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x2A, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0xAA, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Acquire (VSMX, 0xFFFF)
                        Store (0x94, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local1)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01)) {}
                        Else
                        {
                            If (LEqual (Local1, 0x01))
                            {
                                Store (0xE0, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0x71, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0xE0, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0xF1, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                            }
                            Else
                            {
                                Store (0xE0, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0x72, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0xE0, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0xF2, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                            }
                        }

                        Release (VSMX)
                    }

                    Method (_Q30, 0, NotSerialized)
                    {
                        Store (0x30, \_SB.PCI0.LPCB.P80H)
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x30, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0x99, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (\_SB.INF0, Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Store (0xE0, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0x56, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                            }
                            Else
                            {
                                Store (0xE0, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0x55, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                            }
                        }

                        Release (VSMX)
                    }

                    Method (_Q36, 0, NotSerialized)
                    {
                        Store (0x36, \_SB.PCI0.LPCB.P80H)
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x31, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x6C, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q50, 0, NotSerialized)
                    {
                        Store (0x50, \_SB.PCI0.LPCB.P80H)
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x36, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x32, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, \_SB.PCI0.LPCB.P80H)
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x11, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x74, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, \_SB.PCI0.LPCB.P80H)
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x12, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0xE0, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (0x73, \_SB.INF0)
                            Store (0x98, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }

                        Release (VSMX)
                    }

                    Method (_Q35, 0, NotSerialized)
                    {
                        Store (0x35, \_SB.PCI0.LPCB.P80H)
                        Acquire (VSMX, 0xFFFF)
                        Store (0x9F, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x44, \_SB.INF0)
                            Store (0x82, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                        }
                        Else
                        {
                            Store (0x9A, \_SB.BCMD)
                            Store (Zero, \_SB.SMIC)
                            Store (\_SB.INF0, Local0)
                            If (LEqual (Local0, 0x00))
                            {
                                Store (0xE0, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0x58, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                            }
                            Else
                            {
                                Store (0xE0, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (0x57, \_SB.INF0)
                                Store (0x98, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                            }
                        }

                        Release (VSMX)
                    }

                    Method (_Q2E, 0, NotSerialized)
                    {
                        Store (0x2E, \_SB.PCI0.LPCB.P80H)
                        If (LEqual (\_SB.PCI0.LPCB.EC.P54, 0x00))
                        {
                            Store (0x98, \_SB.PCI0.LPCB.EC.P54S)
                            Store (0x00, \_SB.LID.LIDS)
                        }
                        Else
                        {
                            Store (0x88, \_SB.PCI0.LPCB.EC.P54S)
                            Store (0x01, \_SB.LID.LIDS)
                        }

                        Notify (\_SB.LID, 0x80)
                    }

                    Method (_Q2F, 0, NotSerialized)
                    {
                        Notify (\_SB.BAT0, 0x80)
                        Store (0x2F, \_SB.PCI0.LPCB.P80H)
                    }

                    Method (_Q31, 0, NotSerialized)
                    {
                        Notify (\_SB.AC, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                        Store (0x84, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Notify (\_SB.BAT0, 0x81)
                        Store (0x85, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Sleep (0x07D0)
                        Notify (\_SB.BAT0, 0x80)
                        Store (\_SB.PCI0.LPCB.GI2X, Local0)
                        And (Local0, 0x07, Local0)
                        If (LNotEqual (Local0, 0x01))
                        {
                            If (LEqual (\_SB.BAT0.BTIN, 0x00))
                            {
                                Store (0x95, \_SB.BCMD)
                                Store (Zero, \_SB.SMIC)
                                Store (\_SB.INF0, Local0)
                                Store (\_SB.INF1, Local1)
                                Store (Local0, \_SB.BAT0.BTHR)
                                Store (Local1, \_SB.BAT0.BDID)
                                If (LEqual (\_SB.BAT0.BDID, 0x01))
                                {
                                    If (LEqual (\_SB.BAT0.BTHR, 0x00))
                                    {
                                        Acquire (VSMX, 0xFFFF)
                                        Store (0x83, \_SB.BCMD)
                                        Store (Zero, \_SB.SMIC)
                                        Release (VSMX)
                                        Sleep (0x03E8)
                                        Acquire (VSMX, 0xFFFF)
                                        Store (0x83, \_SB.BCMD)
                                        Store (Zero, \_SB.SMIC)
                                        Release (VSMX)
                                        Sleep (0x03E8)
                                        Acquire (VSMX, 0xFFFF)
                                        Store (0x83, \_SB.BCMD)
                                        Store (Zero, \_SB.SMIC)
                                        Release (VSMX)
                                        Sleep (0x03E8)
                                        RAMW (0x81, 0x00, 0x05)
                                        Store (RAMR (0xD5, 0x05), Local1)
                                        Add (Local1, 0x01, Local1)
                                        RAMW (0x83, Local1, 0x05)
                                    }
                                }
                            }
                        }
                    }

                    Method (_Q40, 0, NotSerialized)
                    {
                        Store (0x9D, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        Store (Local0, \_SB.PCI0.LPCB.P80H)
                        And (Local0, 0x01, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (One, \_SB.PCI0.AGP.VGA.CRTA)
                            Store (Zero, \_SB.PCI0.AGP.VGA.LCDA)
                            Store (Zero, \_SB.PCI0.AGP.VGA.TVAF)
                            Sleep (0x01F4)
                            Notify (\_SB.PCI0.AGP.VGA, 0x80)
                        }
                    }

                    Method (_Q41, 0, NotSerialized)
                    {
                        Store (Zero, \_SB.PCI0.AGP.VGA.CRTA)
                        Store (One, \_SB.PCI0.AGP.VGA.LCDA)
                        Store (Zero, \_SB.PCI0.AGP.VGA.TVAF)
                        Sleep (0x01F4)
                        Notify (\_SB.PCI0.AGP.VGA, 0x80)
                    }

                    Method (_Q42, 0, NotSerialized)
                    {
                        Store (0x9D, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        Store (Local0, \_SB.PCI0.LPCB.P80H)
                        And (Local0, 0x01, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (One, \_SB.PCI0.AGP.VGA.CRTA)
                            Store (One, \_SB.PCI0.AGP.VGA.LCDA)
                            Store (Zero, \_SB.PCI0.AGP.VGA.TVAF)
                            Sleep (0x01F4)
                            Notify (\_SB.PCI0.AGP.VGA, 0x80)
                        }
                    }

                    Method (_Q43, 0, NotSerialized)
                    {
                        Store (0x43, \_SB.PCI0.LPCB.P80H)
                    }

                    Method (_Q44, 0, NotSerialized)
                    {
                        Store (0x9D, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        Store (Local0, \_SB.PCI0.LPCB.P80H)
                        And (Local0, 0x04, Local0)
                        If (LEqual (Local0, 0x04))
                        {
                            Store (Zero, \_SB.PCI0.AGP.VGA.CRTA)
                            Store (Zero, \_SB.PCI0.AGP.VGA.LCDA)
                            Store (One, \_SB.PCI0.AGP.VGA.TVAF)
                            Sleep (0x01F4)
                            Notify (\_SB.PCI0.AGP.VGA, 0x80)
                        }
                    }

                    Method (_Q45, 0, NotSerialized)
                    {
                        Store (0x45, \_SB.PCI0.LPCB.P80H)
                    }

                    Method (_Q46, 0, NotSerialized)
                    {
                        Store (0x9D, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                        Store (\_SB.INF0, Local0)
                        Store (Local0, \_SB.PCI0.LPCB.P80H)
                        And (Local0, 0x04, Local0)
                        If (LEqual (Local0, 0x04))
                        {
                            Store (Zero, \_SB.PCI0.AGP.VGA.CRTA)
                            Store (One, \_SB.PCI0.AGP.VGA.LCDA)
                            Store (One, \_SB.PCI0.AGP.VGA.TVAF)
                            Sleep (0x01F4)
                            Notify (\_SB.PCI0.AGP.VGA, 0x80)
                        }
                    }

                    Method (_Q77, 0, NotSerialized)
                    {
                        Store (0x77, \_SB.PCI0.LPCB.P80H)
                        Sleep (0xC8)
                        Store (0x01, \_TZ.T4FG)
                        Notify (\_TZ.THRS, 0x80)
                        Notify (\_TZ.THRC, 0x80)
                    }

                    Method (_Q78, 0, NotSerialized)
                    {
                        Store (0x78, \_SB.PCI0.LPCB.P80H)
                        Sleep (0xC8)
                        Store (0x00, \_TZ.T4FG)
                        Notify (\_TZ.THRS, 0x80)
                        Notify (\_TZ.THRC, 0x80)
                    }

                    Method (_Q79, 0, NotSerialized)
                    {
                        Store (0x79, \_SB.PCI0.LPCB.P80H)
                        Notify (\_TZ.THRS, 0x80)
                        Notify (\_TZ.THRC, 0x80)
                        Store (0x00, \_TZ.T4FG)
                    }

                    Method (_Q7F, 0, NotSerialized)
                    {
                        Store (0x90, \_SB.BCMD)
                        Store (Zero, \_SB.SMIC)
                    }
                }

                Method (DFIN, 0, NotSerialized)
                {
                }

                OperationRegion (SIIO, SystemIO, 0x2E, 0x02)
                Field (SIIO, ByteAcc, Lock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                OperationRegion (GIO0, SystemIO, 0x0600, 0x02)
                Field (GIO0, ByteAcc, NoLock, Preserve)
                {
                    GO0X,   8, 
                    GI0X,   8
                }

                OperationRegion (GIO2, SystemIO, 0x0608, 0x02)
                Field (GIO2, ByteAcc, NoLock, Preserve)
                {
                    GO2X,   8, 
                    GI2X,   8
                }

                Mutex (MTIO, 0x00)
                Method (REGR, 2, NotSerialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (0x07, INDX)
                    Store (Arg0, DATA)
                    Store (Arg1, INDX)
                    Store (DATA, Local0)
                    Release (MTIO)
                    Return (Local0)
                }

                Method (REGW, 3, NotSerialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (0x07, INDX)
                    Store (Arg0, DATA)
                    Store (Arg1, INDX)
                    Store (Arg2, DATA)
                    Release (MTIO)
                }

                Method (STAT, 1, NotSerialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (0x26, INDX)
                    And (DATA, Arg0, Local0)
                    Release (MTIO)
                    Return (XOr (Local0, Arg0))
                }

                Device (LPT)
                {
                    Name (FLAG, 0xFF)
                    Method (MODE, 0, NotSerialized)
                    {
                        If (LEqual (FLAG, 0xFF))
                        {
                            If (STAT (0x02))
                            {
                                ShiftRight (REGR (0x01, 0xF0), 0x05, Local0)
                                If (LOr (LEqual (Local0, 0x04), LEqual (Local0, 0x07)))
                                {
                                    Store (0x02, FLAG)
                                }
                                Else
                                {
                                    Store (0x01, FLAG)
                                }
                            }
                            Else
                            {
                                Store (0x00, FLAG)
                            }
                        }

                        Return (FLAG)
                    }

                    Method (_HID, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x02))
                        {
                            Return (0x0104D041)
                        }
                        Else
                        {
                            Return (0x0004D041)
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x00))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (REGR (0x01, 0x30))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
                            }
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        REGW (0x01, 0x30, Zero)
                    }

                    Name (CRSA, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y16)
                        IRQNoFlags (_Y17)
                            {}
                    })
                    Name (CRSB, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y18)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y19)
                        IRQNoFlags (_Y1A)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y1B)
                            {}
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y16._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y16._MAX, MAXA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y17._INT, INTA)
                        CreateByteField (CRSA, \_SB.PCI0.LPCB.LPT._Y16._LEN, LENA)
                        Store (Zero, MINA)
                        Store (Zero, MAXA)
                        Store (Zero, INTA)
                        Store (Zero, LENA)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y18._MIN, MINB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y18._MAX, MAXB)
                        CreateByteField (CRSB, \_SB.PCI0.LPCB.LPT._Y18._LEN, LENB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y19._MIN, MINC)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y19._MAX, MAXC)
                        CreateByteField (CRSB, \_SB.PCI0.LPCB.LPT._Y19._LEN, LENC)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y1A._INT, INTB)
                        CreateByteField (CRSB, \_SB.PCI0.LPCB.LPT._Y1B._DMA, DMAB)
                        Store (Zero, MINB)
                        Store (Zero, MAXB)
                        Store (Zero, LENB)
                        Store (Zero, MINC)
                        Store (Zero, MAXC)
                        Store (Zero, LENC)
                        Store (Zero, INTB)
                        Store (Zero, DMAB)
                        If (REGR (0x01, 0x30))
                        {
                            ShiftLeft (REGR (0x01, 0x60), 0x08, Local0)
                            Add (Local0, REGR (0x01, 0x61), Local0)
                            Store (Local0, MINA)
                            Store (Local0, MAXA)
                            Store (Local0, MINB)
                            Store (Local0, MAXB)
                            Add (Local0, 0x0400, Local0)
                            Store (Local0, MINC)
                            Store (Local0, MAXC)
                            If (LEqual (Local0, 0x07BC))
                            {
                                Store (0x04, LENA)
                                Store (0x04, LENB)
                                Store (0x04, LENC)
                            }
                            Else
                            {
                                Store (0x08, LENA)
                                Store (0x08, LENB)
                                Store (0x08, LENC)
                            }

                            And (REGR (0x01, 0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, Local0)
                            }

                            Store (Local0, INTA)
                            Store (Local0, INTB)
                            Store (REGR (0x01, 0x74), Local0)
                            If (LNotEqual (Local0, 0x04))
                            {
                                ShiftLeft (One, Local0, DMAB)
                            }
                        }

                        If (LEqual (MODE (), 0x02))
                        {
                            Return (CRSB)
                        }
                        Else
                        {
                            Return (CRSA)
                        }
                    }

                    Name (PRSA, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                        }
                        EndDependentFn ()
                    })
                    Name (PRSB, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0678,             // Range Minimum
                                0x0678,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IO (Decode16,
                                0x07BC,             // Range Minimum
                                0x07BC,             // Range Maximum
                                0x01,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {5,7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1,3}
                        }
                        EndDependentFn ()
                    })
                    Method (_PRS, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x02))
                        {
                            Return (PRSB)
                        }
                        Else
                        {
                            Return (PRSA)
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x02))
                        {
                            Store (Arg0, CRSB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y18._MIN, MINB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.LPT._Y1A._INT, INTB)
                            CreateByteField (CRSB, \_SB.PCI0.LPCB.LPT._Y1B._DMA, DMAB)
                            FindSetRightBit (DMAB, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                            }
                            Else
                            {
                                Store (0x04, Local0)
                            }

                            Store (MINB, Local1)
                            Store (INTB, Local2)
                        }
                        Else
                        {
                            Store (Arg0, CRSA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y16._MIN, MINA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.LPT._Y17._INT, INTA)
                            Store (0x04, Local0)
                            Store (MINA, Local1)
                            Store (INTA, Local2)
                        }

                        REGW (0x01, 0x74, Local0)
                        ShiftRight (Local1, 0x08, Local0)
                        REGW (0x01, 0x60, Local0)
                        And (Local1, 0xFF, Local0)
                        REGW (0x01, 0x61, Local0)
                        FindSetRightBit (Local2, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        REGW (0x01, 0x70, Local0)
                        REGW (0x01, 0x30, 0x01)
                    }
                }

                Device (COMB)
                {
                    Name (FLAG, 0xFF)
                    Method (MODE, 0, NotSerialized)
                    {
                        If (LEqual (FLAG, 0xFF))
                        {
                            If (STAT (0x04))
                            {
                                If (LEqual (REGR (0x02, 0x74), 0x04))
                                {
                                    Store (0x03, FLAG)
                                }
                                Else
                                {
                                    Store (0x04, FLAG)
                                }
                            }
                            Else
                            {
                                Store (0x00, FLAG)
                            }
                        }

                        Return (FLAG)
                    }

                    Method (_HID, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x04))
                        {
                            Return (0x0160633A)
                        }
                        Else
                        {
                            Return (0x1005D041)
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x00))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (REGR (0x02, 0x30))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
                            }
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        REGW (0x02, 0x30, Zero)
                    }

                    Name (CRSA, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y1C)
                        IRQNoFlags (_Y1D)
                            {}
                    })
                    Name (CRSB, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y1E)
                        IRQNoFlags (_Y1F)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y20)
                            {}
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y1C._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y1C._MAX, MAXA)
                        CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y1D._INT, INTA)
                        Store (Zero, MINA)
                        Store (Zero, MAXA)
                        Store (Zero, INTA)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y1E._MIN, MINB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y1E._MAX, MAXB)
                        CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y1F._INT, INTB)
                        CreateByteField (CRSB, \_SB.PCI0.LPCB.COMB._Y20._DMA, DMAB)
                        Store (Zero, MINB)
                        Store (Zero, MAXB)
                        Store (Zero, INTB)
                        Store (Zero, DMAB)
                        If (REGR (0x02, 0x30))
                        {
                            ShiftLeft (REGR (0x02, 0x60), 0x08, Local0)
                            Add (Local0, REGR (0x02, 0x61), Local0)
                            Store (Local0, MINA)
                            Store (Local0, MAXA)
                            Store (Local0, MINB)
                            Store (Local0, MAXB)
                            And (REGR (0x02, 0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, Local0)
                            }

                            Store (Local0, INTA)
                            Store (Local0, INTB)
                            Store (REGR (0x02, 0x74), Local0)
                            If (LNotEqual (Local0, 0x04))
                            {
                                ShiftLeft (One, Local0, DMAB)
                            }
                        }

                        If (LEqual (MODE (), 0x04))
                        {
                            Return (CRSB)
                        }
                        Else
                        {
                            Return (CRSA)
                        }
                    }

                    Name (PRSA, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                        }
                        EndDependentFn ()
                    })
                    Name (PRSB, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0,1,2,3}
                        }
                        EndDependentFn ()
                    })
                    Method (_PRS, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x04))
                        {
                            Return (PRSB)
                        }
                        Else
                        {
                            Return (PRSA)
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LEqual (MODE (), 0x04))
                        {
                            Store (Arg0, CRSB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y1E._MIN, MINB)
                            CreateWordField (CRSB, \_SB.PCI0.LPCB.COMB._Y1F._INT, INTB)
                            CreateByteField (CRSB, \_SB.PCI0.LPCB.COMB._Y20._DMA, DMAB)
                            FindSetRightBit (DMAB, Local0)
                            If (Local0)
                            {
                                Decrement (Local0)
                            }
                            Else
                            {
                                Store (0x04, Local0)
                            }

                            Store (MINB, Local1)
                            Store (INTB, Local2)
                        }
                        Else
                        {
                            Store (Arg0, CRSA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y1C._MIN, MINA)
                            CreateWordField (CRSA, \_SB.PCI0.LPCB.COMB._Y1D._INT, INTA)
                            Store (0x04, Local0)
                            Store (MINA, Local1)
                            Store (INTA, Local2)
                        }

                        REGW (0x02, 0x74, Local0)
                        ShiftRight (Local1, 0x08, Local0)
                        REGW (0x02, 0x60, Local0)
                        And (Local1, 0xFF, Local0)
                        REGW (0x02, 0x61, Local0)
                        FindSetRightBit (Local2, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        REGW (0x02, 0x70, Local0)
                        REGW (0x02, 0x30, 0x01)
                        If (LEqual (MODE (), 0x04))
                        {
                            Or (REGR (0x02, 0xF0), 0x80, Local0)
                            REGW (0x02, 0xF0, Local0)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        REGW (0x02, 0xF0, 0x82)
                        REGW (0x02, 0x30, 0x01)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        REGW (0x02, 0x30, 0x00)
                    }
                }
            }

            Name (REGT, Package (0x15)
            {
                0x10, 
                0x20, 
                0x21, 
                0x22, 
                0x23, 
                0x33, 
                0x34, 
                0x35, 
                0x36, 
                0x37, 
                0x47, 
                0x48, 
                0x49, 
                0x4A, 
                0x4B, 
                0x4C, 
                0x5C, 
                0x5D, 
                0x5E, 
                0x5F, 
                0x6F
            })
            Name (DMTT, Package (0x07)
            {
                0x0F, 
                0x14, 
                0x1E, 
                0x2D, 
                0x3C, 
                0x4B, 
                0x78
            })
            Name (PIOT, Package (0x07)
            {
                0x0258, 
                0x017F, 
                0xF0, 
                0xB4, 
                0x78, 
                0x5A, 
                0x00
            })
            Device (IDE)
            {
                Name (_ADR, 0x00110001)
                OperationRegion (PCI, PCI_Config, 0x48, 0x60)
                Field (PCI, DWordAcc, NoLock, Preserve)
                {
                    SDR1,   8, 
                    SDR0,   8, 
                    PDR1,   8, 
                    PDR0,   8, 
                    SDST,   4, 
                    PDST,   4, 
                            Offset (0x08), 
                    UDMS,   16, 
                    UDMP,   16
                }

                Name (Z002, 0x00)
                Name (Z003, 0x00)
                Method (_PS3, 0, NotSerialized)
                {
                    And (^UDMP, 0x10, ^Z002)
                    And (^UDMS, 0x10, ^Z003)
                }

                Method (_PS0, 0, NotSerialized)
                {
                    If (^Z002)
                    {
                        Or (^UDMP, ^Z002, Local0)
                        Or (Local0, ShiftLeft (^Z002, 0x08), ^UDMP)
                    }

                    If (^Z003)
                    {
                        Or (^UDMS, ^Z003, Local0)
                        Or (Local0, ShiftLeft (^Z003, 0x08), ^UDMS)
                    }
                }

                Method (GIDX, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (0x00, Local1)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x0E))
                        {
                            Store (0x06, Local1)
                        }
                        Else
                        {
                            Add (ShiftRight (Arg0, 0x01), 0x01, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (RIDX, 1, NotSerialized)
                {
                    Store (0x00, Local0)
                    While (NAnd (LLess (Local0, 0x07), LEqual (DerefOf (Index (^^DMTT, Local0
                        )), Arg0)))
                    {
                        Increment (Local0)
                    }

                    If (Local0)
                    {
                        If (LGreater (Local0, 0x06))
                        {
                            Store (0x0E, Local0)
                        }
                        Else
                        {
                            Subtract (ShiftLeft (Local0, 0x01), 0x01, Local0)
                            If (LNotEqual (Local0, 0x01))
                            {
                                Decrement (Local0)
                            }
                        }
                    }

                    Return (Local0)
                }

                Method (GTM, 3, NotSerialized)
                {
                    Store (Buffer (0x14) {}, Local0)
                    CreateDWordField (Local0, 0x00, PIO0)
                    CreateDWordField (Local0, 0x04, DMA0)
                    CreateDWordField (Local0, 0x08, PIO1)
                    CreateDWordField (Local0, 0x0C, DMA1)
                    CreateDWordField (Local0, 0x10, FLAG)
                    Store (Zero, FLAG)
                    Or (FLAG, 0x10, FLAG)
                    Add (And (Arg1, 0x0F), ShiftRight (Arg1, 0x04), Local1)
                    Add (Local1, 0x02, Local1)
                    Multiply (Local1, 0x1E, PIO0)
                    Or (FLAG, 0x02, FLAG)
                    Add (And (Arg2, 0x0F), ShiftRight (Arg2, 0x04), Local1)
                    Add (Local1, 0x02, Local1)
                    Multiply (Local1, 0x1E, PIO1)
                    Or (FLAG, 0x08, FLAG)
                    And (Arg0, 0x0F, Local1)
                    If (And (Arg0, 0xE0))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (^GIDX (Local1), Local1)
                    }
                    Else
                    {
                        Store (0x06, Local1)
                    }

                    Store (DerefOf (Index (^^DMTT, Local1)), DMA1)
                    ShiftRight (And (Arg0, 0x0F00), 0x08, Local1)
                    If (And (Arg0, 0xE000))
                    {
                        Or (FLAG, 0x01, FLAG)
                        Store (^GIDX (Local1), Local1)
                    }
                    Else
                    {
                        Store (0x06, Local1)
                    }

                    Store (DerefOf (Index (^^DMTT, Local1)), DMA0)
                    Return (Local0)
                }

                Method (STM, 3, NotSerialized)
                {
                    Store (Buffer (0x05) {}, Local7)
                    CreateWordField (Local7, 0x00, UDMT)
                    CreateWordField (Local7, 0x02, PIOT)
                    CreateByteField (Local7, 0x04, R4CT)
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Store (FLAG, Local4)
                    Store (0x0E0E, Local1)
                    If (And (Local4, 0x01))
                    {
                        And (Local1, 0x0F, Local1)
                        Store (^RIDX (DMA0), Local3)
                        Or (Local3, 0xE0, Local3)
                        Or (ShiftLeft (Local3, 0x08), Local1, Local1)
                    }

                    If (And (Local4, 0x04))
                    {
                        And (Local1, 0xFF00, Local1)
                        Store (^RIDX (DMA1), Local3)
                        Or (Local3, 0xE0, Local3)
                        Or (Local3, Local1, Local1)
                    }

                    Store (Local1, UDMT)
                    Store (0x0A, Local2)
                    If (And (Local4, 0x02))
                    {
                        Divide (PIO0, 0x1E, , Local3)
                        Subtract (Local3, 0x03, Local3)
                        If (LLess (Local3, 0x0C))
                        {
                            And (Local2, 0x03, Local2)
                            Or (Local2, 0x04, Local2)
                        }

                        Store (ShiftLeft (DerefOf (Index (^^REGT, Local3)), 0x08), Local6)
                    }
                    Else
                    {
                        Store (0x00, Local6)
                    }

                    If (And (Local4, 0x08))
                    {
                        Divide (PIO1, 0x1E, , Local3)
                        Subtract (Local3, 0x03, Local3)
                        If (LLess (Local3, 0x0C))
                        {
                            And (Local2, 0x0C, Local2)
                            Or (Local2, 0x01, Local2)
                        }

                        Store (DerefOf (Index (^^REGT, Local3)), Local6)
                    }
                    Else
                    {
                        Store (And (Local6, 0xFF00), Local6)
                    }

                    Store (Local2, R4CT)
                    Store (Local6, PIOT)
                    Return (Local7)
                }

                Method (GTF, 3, NotSerialized)
                {
                    If (Arg2)
                    {
                        Store (Buffer (0x07)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            }, Local7)
                    }
                    Else
                    {
                        Store (Buffer (0x07)
                            {
                                0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            }, Local7)
                    }

                    CreateByteField (Local7, 0x01, MODE)
                    Add (And (Arg0, 0x0F), ShiftRight (Arg0, 0x04), Local1)
                    Add (Local1, 0x02, Local1)
                    Multiply (Local1, 0x1E, Local0)
                    Store (Match (^^PIOT, MLT, Local0, MTR, 0x00, 0x00), Local1)
                    If (Local1)
                    {
                        Decrement (Local1)
                    }

                    If (And (Arg1, 0xE0))
                    {
                        Store (^GIDX (And (Arg1, 0x0F)), Local0)
                        If (LGreater (Local0, 0x06))
                        {
                            Store (0x00, Local0)
                        }
                        Else
                        {
                            Subtract (0x06, Local0, Local0)
                        }

                        Or (Local0, 0x40, MODE)
                    }
                    Else
                    {
                        Or (Local1, 0x08, MODE)
                    }

                    Concatenate (Local7, Local7, Local6)
                    Or (Local1, 0x08, MODE)
                    Concatenate (Local6, Local7, Local5)
                    Return (Local5)
                }

                Device (PRIM)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (\_SB.PCI0.LPCB.GI0X, Local0)
                        And (Local0, 0x04, Local0)
                        If (LEqual (Local0, 0x04))
                        {
                            Store (\_SB.PCI0.LPCB.GI0X, Local1)
                            And (Local1, 0xFB, Local1)
                            Store (Local1, \_SB.PCI0.LPCB.GO0X)
                        }

                        Store ("GTM - Primary Controller", Debug)
                        Store (^^GTM (^^UDMP, ^^PDR0, ^^PDR1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store ("STM - Primary Controller", Debug)
                        Store (^^STM (Arg0, Arg1, Arg2), Local0)
                        CreateWordField (Local0, 0x00, UDMA)
                        CreateWordField (Local0, 0x02, PIOM)
                        CreateByteField (Local0, 0x04, ADST)
                        Store (Or (UDMA, And (^^UDMP, 0x1010)), ^^UDMP)
                        Store (And (PIOM, 0xFF), Local1)
                        If (Local1)
                        {
                            Store (Local1, ^^PDR1)
                        }

                        ShiftRight (PIOM, 0x08, Local1)
                        If (Local1)
                        {
                            Store (Local1, ^^PDR0)
                        }

                        Store (ADST, ^^PDST)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Primary Master", Debug)
                            ShiftRight (^^^UDMP, 0x08, Local0)
                            Store (^^^GTF (^^^PDR0, Local0, 0x01), Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Primary Slave", Debug)
                            Store (^^^GTF (^^^PDR1, ^^^UDMP, 0x00), Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECN)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Store ("GTM - Secondary Controller", Debug)
                        Store (^^GTM (^^UDMS, ^^SDR0, ^^SDR1), Local0)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store ("STM - Secondary Controller", Debug)
                        Store (^^STM (Arg0, Arg1, Arg2), Local0)
                        CreateWordField (Local0, 0x00, DMAS)
                        CreateWordField (Local0, 0x02, PIOS)
                        CreateByteField (Local0, 0x04, ADSS)
                        Store (Or (DMAS, And (^^UDMS, 0x1010)), ^^UDMS)
                        And (PIOS, 0xFF, Local1)
                        If (Local1)
                        {
                            Store (Local1, ^^SDR1)
                        }

                        ShiftRight (PIOS, 0x08, Local1)
                        If (Local1)
                        {
                            Store (Local1, ^^SDR0)
                        }

                        Store (ADSS, ^^SDST)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Secondary Master", Debug)
                            ShiftRight (^^^UDMS, 0x08, Local0)
                            Store (^^^GTF (^^^SDR0, Local0, 0x01), Local0)
                            Return (Local0)
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store ("GTF - Secondary Slave", Debug)
                            Store (^^^GTF (^^^SDR1, ^^^UDMS, 0x00), Local0)
                            Return (Local0)
                        }
                    }
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x00100000)
                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.LPCB.ESB1)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x00100001)
                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.LPCB.ESB2)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x00100002)
                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.LPCB.ESB3)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB4)
            {
                Name (_ADR, 0x00100003)
                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.LPCB.ESB4)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Device (Z004)
            {
                Name (_ADR, 0x00110005)
                OperationRegion (SB75, PCI_Config, 0x00, 0x80)
                Field (SB75, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x2C), 
                    AD2C,   32, 
                            Offset (0x42), 
                        ,   5, 
                    Z005,   1
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.LPCB.AC97)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Name (Z006, 0x00)
                Method (_PS0, 0, NotSerialized)
                {
                    If (LEqual (^AD2C, 0x00))
                    {
                        Store (0x01, ^Z005)
                        Store (Z006, ^AD2C)
                        Store (0x00, ^Z005)
                    }
                    Else
                    {
                        Store (^AD2C, Z006)
                    }
                }

                Method (_PS3, 0, NotSerialized)
                {
                    Store (^AD2C, Z006)
                }
            }

            Device (Z007)
            {
                Name (_ADR, 0x00110006)
                OperationRegion (SB76, PCI_Config, 0x00, 0x80)
                Field (SB76, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x2C), 
                    MD2C,   32, 
                            Offset (0x44), 
                        ,   4, 
                    Z008,   1, 
                        ,   1, 
                    SCON,   1
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.LPCB.MC97)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        If (^SCON)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Store (0x01, \_SB.PCI0.LPCB.MC97)
                            Sleep (0x32)
                            Return (0x00)
                        }
                    }
                }

                Name (Z006, 0x00)
                Method (_PS0, 0, NotSerialized)
                {
                    If (LEqual (^MD2C, 0x00))
                    {
                        Store (0x01, ^Z008)
                        Store (Z006, ^MD2C)
                        Store (0x00, ^Z008)
                    }
                    Else
                    {
                        Store (^MD2C, Z006)
                    }
                }

                Method (_PS3, 0, NotSerialized)
                {
                    Store (^MD2C, Z006)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x04
                })
            }

            Device (GLAN)
            {
                Name (_ADR, 0x000C0000)
                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (\_SB.PCI0.LPCB.ILAN, 0x00))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (0x00)
                    }

                    Return (0x0F)
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x03)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x03)
                }

                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x05
                })
            }

            Device (ILAN)
            {
                Name (_ADR, 0x00120000)
                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (\_SB.PCI0.LPCB.ILAN, 0x01))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x03)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x03)
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x05
                })
            }
        }

        Device (AC)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                Store ("------------------------- AC_STA", Debug)
                Return (0x0F)
            }

            Name (ACFG, 0x00)
            Name (ACP, 0x01)
            Method (_PSR, 0, NotSerialized)
            {
                Store (0x9E, \_SB.BCMD)
                Store (Zero, \_SB.SMIC)
                Store (\_SB.INF0, Local0)
                Store (Local0, ACFG)
                If (LEqual (Local0, 0x01))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (BDID, 0x00)
            Name (BTHR, 0x01)
            Name (BTIN, 0x01)
            Name (BP, 0x01)
            Name (IBP, 0x00)
            Name (PSTA, 0x1F)
            Name (CHAR, 0x01)
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
                        "        "
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

            Name (PBIF, Package (0x0D)
            {
                0x01, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x01, 
                0xFFFFFFFF, 
                0x1E, 
                0x14, 
                0x0A, 
                0x0D8E, 
                "BAT0", 
                " ", 
                " ", 
                "    "
            })
            Name (PBST, Package (0x04)
            {
                0x00, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x39D0
            })
            Name (UBIF, 0x01E9)
            Name (SMBF, Zero)
            Name (BANO, 0x18)
            Method (_STA, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPCB.EC.ECOK)
                {
                    Store (0x9C, \_SB.BCMD)
                    Store (Zero, \_SB.SMIC)
                    Store (\_SB.INF0, Local5)
                    Store (Local5, BTIN)
                    If (LEqual (Local5, 0x01))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (0x1F)
                    }
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPCB.EC.ECOK)
                {
                    Store (BTIN, Local5)
                    If (LEqual (Local5, 0x01))
                    {
                        IVBI ()
                    }
                    Else
                    {
                        UPBI ()
                    }
                }
                Else
                {
                    IVBI ()
                }

                Store ("BAT0_BIF_RETURN:", Debug)
                Return (PBIF)
            }

            Method (_BST, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPCB.EC.ECOK)
                {
                    Store (BTIN, Local5)
                    If (LEqual (Local5, 0x01))
                    {
                        IVBS ()
                    }
                    Else
                    {
                        UPBS ()
                    }
                }
                Else
                {
                    IVBS ()
                }

                Store ("BAT0_BST_RETURN:", Debug)
                Return (PBST)
            }

            Method (IVBI, 0, NotSerialized)
            {
                Store (0x01E9, UBIF)
                Store (0xFFFFFFFF, Index (PBIF, 0x01))
                Store (0xFFFFFFFF, Index (PBIF, 0x02))
                Store (0xFFFFFFFF, Index (PBIF, 0x04))
                Store ("Bad", Index (PBIF, 0x09))
                Store ("Bad", Index (PBIF, 0x0A))
                Store ("Bad", Index (PBIF, 0x0B))
                Store ("Bad", Index (PBIF, 0x0C))
            }

            Method (IVBS, 0, NotSerialized)
            {
                Store (Zero, Index (PBST, 0x00))
                Store (0xFFFFFFFF, Index (PBST, 0x01))
                Store (0xFFFFFFFF, Index (PBST, 0x02))
                Store (0xFFFFFFFF, Index (PBST, 0x03))
            }

            Method (UPBI, 0, NotSerialized)
            {
                If (LEqual (BANO, 0x20))
                {
                    Store (0x1194, Index (PBIF, 0x01))
                    Store (0x1194, Index (PBIF, 0x02))
                    Store (0x2EE0, Index (PBIF, 0x04))
                    Store (0x01C2, Index (PBIF, 0x05))
                    Store (0x87, Index (PBIF, 0x06))
                    Store (0x013B, Index (PBIF, 0x07))
                    Store (0x10E0, Index (PBIF, 0x08))
                    Store ("Bat10Cell", Index (PBIF, 0x09))
                    Store ("236", Index (PBIF, 0x0A))
                    Store ("NiMH", Index (PBIF, 0x0B))
                    Store ("SANYO", Index (PBIF, 0x0C))
                }

                If (LEqual (BANO, 0x18))
                {
                    Store (0x0FA0, Index (PBIF, 0x01))
                    Store (0x0FA0, Index (PBIF, 0x02))
                    Store (0x39D0, Index (PBIF, 0x04))
                    Store (0x0190, Index (PBIF, 0x05))
                    Store (0x78, Index (PBIF, 0x06))
                    Store (0x0118, Index (PBIF, 0x07))
                    Store (0x0F28, Index (PBIF, 0x08))
                    Store ("Bat 8Cell", Index (PBIF, 0x09))
                    Store ("236", Index (PBIF, 0x0A))
                    Store ("Lion", Index (PBIF, 0x0B))
                    Store ("Acer", Index (PBIF, 0x0C))
                }

                If (LEqual (BANO, 0x1C))
                {
                    Store (0x19C8, Index (PBIF, 0x01))
                    Store (0x19C8, Index (PBIF, 0x02))
                    Store (0x39D0, Index (PBIF, 0x04))
                    Store (0x0294, Index (PBIF, 0x05))
                    Store (0xC7, Index (PBIF, 0x06))
                    Store (0x01CD, Index (PBIF, 0x07))
                    Store (0x1901, Index (PBIF, 0x08))
                    Store ("Bat12Cell", Index (PBIF, 0x09))
                    Store ("236", Index (PBIF, 0x0A))
                    Store ("Lion", Index (PBIF, 0x0B))
                    Store ("SANYO", Index (PBIF, 0x0C))
                }

                If (LEqual (BANO, 0x1D))
                {
                    Store (0x1932, Index (PBIF, 0x01))
                    Store (0x1932, Index (PBIF, 0x02))
                    Store (0x39D0, Index (PBIF, 0x04))
                    Store (0x0285, Index (PBIF, 0x05))
                    Store (0xC2, Index (PBIF, 0x06))
                    Store (0x01C4, Index (PBIF, 0x07))
                    Store (0x1871, Index (PBIF, 0x08))
                    Store ("Bat12Cell", Index (PBIF, 0x09))
                    Store ("236", Index (PBIF, 0x0A))
                    Store ("Lion", Index (PBIF, 0x0B))
                    Store ("SONY", Index (PBIF, 0x0C))
                }

                If (LEqual (BANO, 0x1F))
                {
                    Store (0x17E9, Index (PBIF, 0x01))
                    Store (0x17E9, Index (PBIF, 0x02))
                    Store (0x41A0, Index (PBIF, 0x04))
                    Store (0x0265, Index (PBIF, 0x05))
                    Store (0xB8, Index (PBIF, 0x06))
                    Store (0x01AD, Index (PBIF, 0x07))
                    Store (0x1731, Index (PBIF, 0x08))
                    Store ("Bat12Cell", Index (PBIF, 0x09))
                    Store ("236", Index (PBIF, 0x0A))
                    Store ("Lion", Index (PBIF, 0x0B))
                    Store ("SMP-SS", Index (PBIF, 0x0C))
                }
            }

            Method (UPBS, 0, NotSerialized)
            {
                Store (0x97, \_SB.BCMD)
                Store (Zero, \_SB.SMIC)
                Store (\_SB.INF0, Local0)
                Sleep (0x64)
                Store (\_SB.AC.ACFG, Local1)
                If (LEqual (Local1, 0x01))
                {
                    If (LGreaterEqual (Local0, 0x5A))
                    {
                        Store (\_SB.PCI0.LPCB.GI2X, Local3)
                        And (Local3, 0x08, Local3)
                        ShiftRight (Local3, 0x03, Local3)
                        If (LEqual (Local3, 0x01))
                        {
                            If (LGreaterEqual (Local0, 0x63))
                            {
                                Store (0x00, Index (PBST, 0x00))
                                Store (0x64, Local0)
                            }
                            Else
                            {
                                Store (0x00, Index (PBST, 0x00))
                            }
                        }
                        Else
                        {
                            Store (0x02, Index (PBST, 0x00))
                        }
                    }
                    Else
                    {
                        Store (0x02, Index (PBST, 0x00))
                    }
                }
                Else
                {
                    If (LLessEqual (Local0, 0x0A))
                    {
                        Store (0x05, Index (PBST, 0x00))
                    }
                    Else
                    {
                        Store (0x01, Index (PBST, 0x00))
                    }
                }

                Store (0xFFFFFFFF, Index (PBST, 0x01))
                If (LEqual (BANO, 0x20))
                {
                    Multiply (Local0, 0x01C2, Local2)
                    Divide (Local2, 0x0A, Local1, Local2)
                    Store (Local2, Index (PBST, 0x02))
                    Store (0x2EE0, Index (PBST, 0x03))
                }

                If (LEqual (BANO, 0x18))
                {
                    Multiply (Local0, 0x0190, Local2)
                    Divide (Local2, 0x0A, Local1, Local2)
                    Store (Local2, Index (PBST, 0x02))
                    Store (0x39D0, Index (PBST, 0x03))
                }

                If (LEqual (BANO, 0x1C))
                {
                    Multiply (Local0, 0x0294, Local2)
                    Divide (Local2, 0x0A, Local1, Local2)
                    Store (Local2, Index (PBST, 0x02))
                    Store (0x39D0, Index (PBST, 0x03))
                }

                If (LEqual (BANO, 0x1D))
                {
                    Multiply (Local0, 0x0285, Local2)
                    Divide (Local2, 0x0A, Local1, Local2)
                    Store (Local2, Index (PBST, 0x02))
                    Store (0x39D0, Index (PBST, 0x03))
                }

                If (LEqual (BANO, 0x1F))
                {
                    Multiply (Local0, 0x0265, Local2)
                    Divide (Local2, 0x0A, Local1, Local2)
                    Store (Local2, Index (PBST, 0x02))
                    Store (0x41A0, Index (PBST, 0x03))
                }
            }

            Method (CHBP, 0, NotSerialized)
            {
                Store (Zero, Local0)
                Store (\_SB.PCI0.LPCB.EC.COMD (0xC5, 0x1A), Local5)
                If (LEqual (Local5, 0x01))
                {
                    Store ("--------------------------------BAT0 is not present", Debug)
                    If (BP)
                    {
                        Store ("--------------------------------BAT0 is just disconnected", Debug)
                        Store (0x00, BP)
                        IVBI ()
                        IVBS ()
                        Or (0x04, Local0, Local0)
                    }
                }
                Else
                {
                    If (BP)
                    {
                        Store ("--------------------------------BAT0 is still present", Debug)
                        If (UPBI ())
                        {
                            Or (0x01, Local0, Local0)
                        }

                        If (UPBS ())
                        {
                            Or (0x02, Local0, Local0)
                        }

                        Store ("------local0.0 = BAT0 PBIF modified-----", Debug)
                        Store (Local0, Debug)
                        Store ("------local0.1 = BAT0 PBST modified-----", Debug)
                    }
                    Else
                    {
                        Store ("--------------------------------BAT0 just connect", Debug)
                        UPBI ()
                        UPBS ()
                        Store (0x01, BP)
                        Or (0x05, Local0, Local0)
                        Store (0x01E9, UBIF)
                    }
                }

                Return (Local0)
            }

            Method (CHSM, 0, NotSerialized)
            {
                If (LNot (\_SB.PCI0.LPCB.EC.SMRD (0x09, 0x16, 0x0A, RefOf (Local5))))
                {
                    Store (Zero, SMBF)
                }
                Else
                {
                    Store (One, SMBF)
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Name (LIDS, 0x01)
            Method (_LID, 0, NotSerialized)
            {
                If (LIDS)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x00, 
                0x03
            })
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Name (_PRW, Package (0x02)
            {
                0x00, 
                0x03
            })
        }
    }
}

