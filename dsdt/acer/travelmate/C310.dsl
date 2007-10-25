/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of C310, Thu Oct 25 12:48:20 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00006284 (25220)
 *     Revision         0x01
 *     OEM ID           "INTEL "
 *     OEM Table ID     "ALVISO  "
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("C310.aml", "DSDT", 1, "INTEL ", "ALVISO  ", 0x06040000)
{
    OperationRegion (PORT, SystemIO, 0x80, 0x01)
    Field (PORT, ByteAcc, NoLock, Preserve)
    {
        P80H,   8
    }

    OperationRegion (NSIO, SystemIO, 0x0680, 0x10)
    Field (NSIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x01), 
        GPI0,   8
    }

    OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
    Field (IO_T, ByteAcc, NoLock, Preserve)
    {
                Offset (0x02), 
                Offset (0x04), 
                Offset (0x06), 
                Offset (0x08), 
        TRP0,   8, 
                Offset (0x0A), 
                Offset (0x0B), 
                Offset (0x0C), 
                Offset (0x0D), 
                Offset (0x0E), 
                Offset (0x0F), 
                Offset (0x10)
    }

    OperationRegion (PMIO, SystemIO, 0x1000, 0x3C)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x28), 
            ,   1, 
        HOTS,   1, 
                Offset (0x2C), 
            ,   1, 
        HOTP,   1
    }

    OperationRegion (GPIO, SystemIO, 0x1180, 0x3C)
    Field (GPIO, ByteAcc, NoLock, Preserve)
    {
        GU00,   8, 
        GU01,   8, 
        GU02,   8, 
        GU03,   8, 
        GIO0,   8, 
        GIO1,   8, 
        GIO2,   8, 
        GIO3,   8, 
                Offset (0x0C), 
        GL00,   8, 
        GL01,   8, 
            ,   5, 
        GP21,   1, 
            ,   1, 
        GP23,   1, 
            ,   1, 
        GP25,   1, 
                Offset (0x10), 
                Offset (0x18), 
        GB00,   8, 
        GB01,   8, 
        GB02,   8, 
        GB03,   8, 
                Offset (0x2C), 
        GIV0,   8, 
        GIV1,   8, 
        GIV2,   8, 
        GIV3,   8, 
        GU04,   8, 
        GU05,   8, 
        GU06,   8, 
        GU07,   8, 
        GIO4,   8, 
        GIO5,   8, 
        GIO6,   8, 
        GIO7,   8, 
            ,   1, 
        GP33,   1, 
                Offset (0x39), 
        GL05,   8, 
        GL06,   8, 
        GL07,   8
    }

    OperationRegion (MNVS, SystemMemory, 0x7FEE6DBD, 0x0100)
    Field (MNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
                Offset (0x28), 
        APIC,   8, 
        CPUL,   8, 
        CPUH,   8, 
        GV3E,   8, 
        HTTE,   8, 
        WTHT,   8, 
                Offset (0x32), 
        NATP,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
                Offset (0x39), 
        DCKS,   8, 
                Offset (0x3C), 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
                Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8
    }

    OperationRegion (RCRB, SystemMemory, 0xF0008000, 0x4000)
    Field (RCRB, DWordAcc, Lock, Preserve)
    {
                Offset (0x1000), 
                Offset (0x3000), 
                Offset (0x3404), 
        HPAS,   2, 
            ,   5, 
        HPAE,   1, 
                Offset (0x3418), 
            ,   1, 
        PATD,   1, 
        SATD,   1, 
        SMBD,   1, 
        AZAD,   1, 
        A97D,   1, 
                Offset (0x341A), 
        RP1D,   1, 
        RP2D,   1, 
        RP3D,   1, 
        RP4D,   1
    }

    Mutex (MSMI, 0x07)
    Method (PHSR, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, PRM0)
        Store (Arg0, SMIF)
        Store (Zero, TRP0)
        Store (PRM0, Local0)
        Release (MSMI)
        Return (Local0)
    }

    Method (HKEY, 1, NotSerialized)
    {
        PHSR (0x1E, Arg0)
    }

    Method (LAMN, 1, NotSerialized)
    {
        PHSR (0x1F, Arg0)
    }

    Method (RBEC, 1, NotSerialized)
    {
        Return (PHSR (0x20, Arg0))
    }

    Method (WBEC, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, PRM1)
        Store (Arg0, PRM0)
        Store (0x21, SMIF)
        Store (Zero, TRP0)
        Release (MSMI)
    }

    Method (MBEC, 3, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg2, PRM2)
        Store (Arg1, PRM1)
        Store (Arg0, PRM0)
        Store (0x22, SMIF)
        Store (Zero, TRP0)
        Release (MSMI)
    }

    Mutex (MUTX, 0x00)
    Name (_S0, Package (0x03)
    {
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x03)
    {
        0x05, 
        0x05, 
        0x00
    })
    Name (_S4, Package (0x03)
    {
        0x06, 
        0x06, 
        0x00
    })
    Name (_S5, Package (0x03)
    {
        0x07, 
        0x07, 
        0x00
    })
    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06) {}
        Processor (CPU1, 0x01, 0x00001010, 0x06) {}
    }

    Name (\DSEN, 0x01)
    Name (\ECON, 0x00)
    Name (\GPIC, 0x00)
    Name (\CTYP, 0x00)
    Name (\L01C, 0x00)
    Name (\VGAS, 0x00)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        \_SB.PCI0.DOCK.DPTS (Arg0)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, \_SB.PCI0.LPCB.EC0.BLNK)
        }

        If (LEqual (Arg0, 0x05))
        {
            PHSR (0x31, 0x00)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (Arg0, P80H)
        \_SB.PCI0.PATA.PRID.P_D1.BWAK ()
        Store (0x00, \_SB.PCI0.LPCB.EC0.KTAF)
        Store (0x01, \_SB.PCI0.LPCB.EC0.KTEE)
        \_SB.PCI0.DOCK.DWAK (Arg0)
        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
    }

    Name (FWSO, "FWSO")
    Name (_PSC, 0x00)
    Method (_PS0, 0, NotSerialized)
    {
        Store (_PSC, Local0)
        Store (0x00, _PSC)
    }

    Method (_PS3, 0, NotSerialized)
    {
        Store (0x03, _PSC)
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x00)) {}
            If (LOr (LEqual (Arg0, 0x01), LEqual (Arg0, 0x02))) {}
            If (LEqual (Arg0, 0x03)) {}
            If (LEqual (Arg0, 0x04)) {}
        }
    }

    Scope (\_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Add (L01C, 0x01, L01C)
            If (\_SB.PCI0.RP01.HPCS)
            {
                Store (0x01, P80H)
                If (\_SB.PCI0.RP01.PDC1)
                {
                    Store (0x01, \_SB.PCI0.RP01.PDC1)
                }

                Store (0x01, \_SB.PCI0.RP01.HPCS)
                Sleep (0x012C)
                Notify (\_SB.PCI0.RP01, 0x00)
            }

            If (\_SB.PCI0.RP02.HPCS)
            {
                If (\_SB.PCI0.RP02.PDC2)
                {
                    Store (0x01, \_SB.PCI0.RP02.PDC2)
                }

                Store (0x01, \_SB.PCI0.RP02.HPCS)
                Sleep (0x012C)
                Notify (\_SB.PCI0.RP02, 0x00)
            }
        }

        Method (_L05, 0, NotSerialized)
        {
            If (AZAD)
            {
                Notify (\_SB.PCI0.MODM, 0x02)
            }
            Else
            {
            }
        }

        Method (_L09, 0, NotSerialized)
        {
            If (\_SB.PCI0.RP01.PSP1)
            {
                Store (0x01, \_SB.PCI0.RP01.PSP1)
                Store (0x01, \_SB.PCI0.RP01.PMCS)
                Notify (\_SB.PCI0.RP01, 0x02)
            }

            If (\_SB.PCI0.RP02.PSP2)
            {
                Store (0x01, \_SB.PCI0.RP02.PSP2)
                Store (0x01, \_SB.PCI0.RP02.PMCS)
                Notify (\_SB.PCI0.RP02, 0x02)
            }
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PCIB, 0x02)
        }

        Method (_L1D, 0, NotSerialized)
        {
            Store (0x1D, P80H)
            Notify (\_SB.SLPB, 0x02)
        }
    }

    Method (HKDS, 1, Serialized)
    {
        If (LEqual (0x00, DSEN))
        {
            If (LEqual (Arg0, 0x0A))
            {
                Store (PHSR (0x2D, 0x00), Local0)
                Increment (Local0)
                If (LGreaterEqual (Local0, 0x03))
                {
                    Store (0x00, Local0)
                }
            }
            Else
            {
                Store (Arg0, Local0)
            }

            If (LEqual (Local0, 0x00))
            {
                Store (0x03, \_SB.PCI0.LPCB.N393.R07H)
                Store (0x00, \_SB.PCI0.LPCB.N393.R30H)
                Store (0x0101, NSTE)
            }

            If (LEqual (Local0, 0x01))
            {
                Store (0x03, \_SB.PCI0.LPCB.N393.R07H)
                Store (0x01, \_SB.PCI0.LPCB.N393.R30H)
                Store (0x0808, NSTE)
            }

            If (LEqual (Local0, 0x02))
            {
                Store (0x03, \_SB.PCI0.LPCB.N393.R07H)
                Store (0x01, \_SB.PCI0.LPCB.N393.R30H)
                Store (0x0909, NSTE)
            }

            If (LEqual (Local0, 0x03))
            {
                Store (0x03, \_SB.PCI0.LPCB.N393.R07H)
                Store (0x01, \_SB.PCI0.LPCB.N393.R30H)
                Store (0x0202, NSTE)
            }

            If (LEqual (\_SB.PCI0.IGDD, 0x00))
            {
                Notify (\_SB.PCI0.GFX0, 0x80)
            }
            Else
            {
                Notify (\_SB.PCI0.PEGP.VGA, 0x80)
            }
        }

        If (LEqual (0x01, DSEN))
        {
            PHSR (0x2C, 0x00)
        }
    }

    Scope (\_TZ)
    {
        Name (TBSE, 0x0AAC)
        Name (LTMP, 0x1E)
        Name (CRT0, 0x00)
        Name (CRT1, 0x00)
        Name (PSV0, 0x00)
        Name (PSV1, 0x00)
        Name (S0BF, 0x00)
        Name (S1BF, 0x00)
        Name (T4FG, 0x00)
        Name (T5FG, 0x00)
        ThermalZone (TZS0)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (LEqual (S0BF, 0x00))
                {
                    If (\ECON)
                    {
                        Store (\_SB.PCI0.LPCB.EC0.THSL, Local1)
                    }
                    Else
                    {
                        And (RBEC (0x92), 0x0F, Local1)
                    }

                    If (LGreaterEqual (Local1, 0x04))
                    {
                        Store (0x01, T4FG)
                    }

                    If (LGreaterEqual (Local1, 0x05))
                    {
                        Store (0x01, T5FG)
                    }
                }

                Store (0x01, S0BF)
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.EC0.THS0, Local0)
                }
                Else
                {
                    Store (RBEC (0xA8), Local0)
                }

                If (LEqual (T4FG, 0x01))
                {
                    If (LLessEqual (Local0, PSV0))
                    {
                        Add (PSV0, 0x02, Local0)
                    }
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x00, \_SB.PCI0.LPCB.EC0.TIID)
                    Store (\_SB.PCI0.LPCB.EC0.TS5H, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x00)
                    Store (RBEC (0xDE), Local0)
                }

                If (LGreaterEqual (Local0, 0x80))
                {
                    Store (0x64, Local0)
                }

                Store (Local0, CRT0)
                Return (C2K (Local0))
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Method (_PSV, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x00, \_SB.PCI0.LPCB.EC0.TIID)
                    Store (\_SB.PCI0.LPCB.EC0.TS3H, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x00)
                    Store (RBEC (0xDA), Local0)
                }

                If (LGreaterEqual (Local0, 0x80))
                {
                    Store (0x5A, Local0)
                }

                Store (Local0, PSV0)
                Return (C2K (Local0))
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x05)
            Name (_TSP, 0x012C)
        }

        ThermalZone (TZS1)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (LEqual (S1BF, 0x00))
                {
                    If (\ECON)
                    {
                        Store (\_SB.PCI0.LPCB.EC0.THSL, Local1)
                    }
                    Else
                    {
                        And (RBEC (0x92), 0x0F, Local1)
                    }

                    If (LGreaterEqual (Local1, 0x04))
                    {
                        Store (0x01, T4FG)
                    }

                    If (LGreaterEqual (Local1, 0x05))
                    {
                        Store (0x01, T5FG)
                    }
                }

                Store (0x01, S1BF)
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.EC0.THS1, Local0)
                }
                Else
                {
                    Store (RBEC (0xA9), Local0)
                }

                If (LEqual (T4FG, 0x01))
                {
                    If (LLessEqual (Local0, PSV1))
                    {
                        Add (PSV1, 0x02, Local0)
                    }
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x01, \_SB.PCI0.LPCB.EC0.TIID)
                    Store (\_SB.PCI0.LPCB.EC0.TS5H, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x01)
                    Store (RBEC (0xDE), Local0)
                }

                If (LGreaterEqual (Local0, 0x80))
                {
                    Store (0x64, Local0)
                }

                Store (Local0, CRT1)
                Return (C2K (Local0))
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Method (_PSV, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x01, \_SB.PCI0.LPCB.EC0.TIID)
                    Store (\_SB.PCI0.LPCB.EC0.TS3H, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x01)
                    Store (RBEC (0xDA), Local0)
                }

                If (LGreaterEqual (Local0, 0x80))
                {
                    Store (0x5A, Local0)
                }

                Store (Local0, PSV1)
                Return (C2K (Local0))
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x05)
            Name (_TSP, 0x012C)
        }

        Method (C2K, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            If (LLessEqual (Local0, 0x10))
            {
                Store (LTMP, Local0)
            }

            If (LGreaterEqual (Local0, 0x78))
            {
                Store (LTMP, Local0)
            }

            Add (Multiply (Local0, 0x0A), TBSE, Local0)
            Return (Local0)
        }
    }

    Method (GETP, 1, Serialized)
    {
        If (LEqual (And (Arg0, 0x09), 0x00))
        {
            Return (0xFFFFFFFF)
        }

        If (LEqual (And (Arg0, 0x09), 0x08))
        {
            Return (0x0384)
        }

        ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
        ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
        Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
            ))
    }

    Method (GDMA, 5, Serialized)
    {
        If (Arg0)
        {
            If (LAnd (Arg1, Arg4))
            {
                Return (0x14)
            }

            If (LAnd (Arg2, Arg4))
            {
                Return (Multiply (Subtract (0x04, Arg3), 0x0F))
            }

            Return (Multiply (Subtract (0x04, Arg3), 0x1E))
        }

        Return (0xFFFFFFFF)
    }

    Method (GETT, 1, Serialized)
    {
        Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
            ), 0x03), And (Arg0, 0x03)))))
    }

    Method (GETF, 3, Serialized)
    {
        Name (TMPF, 0x00)
        If (Arg0)
        {
            Or (TMPF, 0x01, TMPF)
        }

        If (And (Arg2, 0x02))
        {
            Or (TMPF, 0x02, TMPF)
        }

        If (Arg1)
        {
            Or (TMPF, 0x04, TMPF)
        }

        If (And (Arg2, 0x20))
        {
            Or (TMPF, 0x08, TMPF)
        }

        If (And (Arg2, 0x4000))
        {
            Or (TMPF, 0x10, TMPF)
        }

        Return (TMPF)
    }

    Method (SETP, 3, Serialized)
    {
        If (LGreater (Arg0, 0xF0))
        {
            Return (0x08)
        }
        Else
        {
            If (And (Arg1, 0x02))
            {
                If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                {
                    Return (0x2301)
                }

                If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                {
                    Return (0x2101)
                }
            }

            Return (0x1001)
        }
    }

    Method (SDMA, 1, Serialized)
    {
        If (LLessEqual (Arg0, 0x14))
        {
            Return (0x01)
        }

        If (LLessEqual (Arg0, 0x1E))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x2D))
        {
            Return (0x01)
        }

        If (LLessEqual (Arg0, 0x3C))
        {
            Return (0x02)
        }

        If (LLessEqual (Arg0, 0x5A))
        {
            Return (0x01)
        }

        Return (0x00)
    }

    Method (SETT, 3, Serialized)
    {
        If (And (Arg1, 0x02))
        {
            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
            {
                Return (0x0B)
            }

            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
            {
                Return (0x09)
            }
        }

        Return (0x04)
    }

    Scope (\_SB)
    {
        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.EC0.KLID, Local0)
                }
                Else
                {
                    And (\RBEC (0x70), 0x02, Local0)
                }

                If (Local0)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_PSW, 1, NotSerialized)
            {
                If (\ECON)
                {
                    Store (Arg0, \_SB.PCI0.LPCB.EC0.LIDW)
                }
                Else
                {
                    If (Arg0)
                    {
                        \MBEC (0x72, 0xEF, 0x10)
                    }
                    Else
                    {
                        \MBEC (0x72, 0xEF, 0x00)
                    }
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x1D, 
                0x03
            })
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Name (_PRW, Package (0x02)
            {
                0x1D, 
                0x03
            })
        }

        Device (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
                If (CondRefOf (_OSI, Local0))
                {
                    Store (0x07D1, OSYS)
                }
                Else
                {
                    If (LOr (LEqual (SizeOf (_OS), 0x14), LEqual (SizeOf (_OS), 0x05)))
                    {
                        Store (0x07D0, OSYS)
                    }
                    Else
                    {
                        If (LEqual (SizeOf (_OS), 0x27))
                        {
                            Store (0x07CF, OSYS)
                        }
                        Else
                        {
                            Store (0x07CE, OSYS)
                        }
                    }
                }
            }

            Method (_S3D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Method (_S4D, 0, NotSerialized)
            {
                Return (0x02)
            }

            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_ADR, 0x00)
            Name (_BBN, 0x00)
            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                        Offset (0x50), 
                    ,   4, 
                PM0H,   2, 
                        Offset (0x51), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                        Offset (0x52), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                        Offset (0x53), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                        Offset (0x54), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                        Offset (0x55), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                        Offset (0x56), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                        Offset (0x57), 
                    ,   7, 
                HENA,   1, 
                        Offset (0x5C), 
                    ,   3, 
                TOUD,   5, 
                        Offset (0xA4), 
                    ,   6, 
                IGDD,   1
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    0x00,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
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
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, M1LN)
                ShiftLeft (TOUD, 0x1B, M1MN)
                Add (Subtract (M1MX, M1MN), 0x01, M1LN)
                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x11)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            0x00, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x07, 
                            0x00, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            0x00, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            0x00, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            0x00, 
                            0x11
                        }
                    })
                }
                Else
                {
                    Return (Package (0x11)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            \_SB.PCI0.LPCB.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x07, 
                            \_SB.PCI0.LPCB.LNKH, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKF, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001EFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKF, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            \_SB.PCI0.LPCB.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            \_SB.PCI0.LPCB.LNKB, 
                            0x00
                        }
                    })
                }
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), DSEN)
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
                            PHSR (0x01, 0x00)
                            If (And (CSTE, 0x0101))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, 0x0101))
                            {
                                Return (0x01)
                            }

                            Return (0x00)
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                            If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                            {
                                Store (NSTE, CSTE)
                            }
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Method (_DCS, 0, NotSerialized)
                        {
                            PHSR (0x01, 0x00)
                            If (And (CSTE, 0x0808))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, 0x0808))
                            {
                                Return (0x01)
                            }

                            Return (0x00)
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                            If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                            {
                                Store (NSTE, CSTE)
                            }
                        }

                        Method (_DDC, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (\_SB.PCI0.PEGP.VGA.DDC4)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.PEGP.VGA.DDC4, \_SB.PCI0.PEGP.VGA.DDC0, Local0)
                                Return (Local0)
                            }

                            Return (0x00)
                        }
                    }

                    Device (TV0)
                    {
                        Name (_ADR, 0x0200)
                        Method (_DCS, 0, NotSerialized)
                        {
                            PHSR (0x01, 0x00)
                            If (And (CSTE, 0x0202))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (And (NSTE, 0x0202))
                            {
                                Return (0x01)
                            }

                            Return (0x00)
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                            If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                            {
                                Store (NSTE, CSTE)
                            }
                        }

                        Method (_DDC, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (\_SB.PCI0.PEGP.VGA.DDC3)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.PEGP.VGA.DDC3, \_SB.PCI0.PEGP.VGA.DDC0, Local0)
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
                        /* 0008 */    0x36, 0x7F, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 
                        /* 0010 */    0x00, 0x00, 0x02, 0x00, 0x01, 0x28, 0x1E, 0x00, 
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
                        /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEC
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x03), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    If (LEqual (NDID, 0x01))
                    {
                        Name (TMP1, Package (0x01)
                        {
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP1, 0x00))
                        Return (TMP1)
                    }

                    If (LEqual (NDID, 0x02))
                    {
                        Name (TMP2, Package (0x02)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP2, 0x00))
                        Store (Or (0x00010000, DID2), Index (TMP2, 0x01))
                        Return (TMP2)
                    }

                    If (LEqual (NDID, 0x03))
                    {
                        Name (TMP3, Package (0x03)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP3, 0x00))
                        Store (Or (0x00010000, DID2), Index (TMP3, 0x01))
                        Store (Or (0x00010000, DID3), Index (TMP3, 0x02))
                        Return (TMP3)
                    }

                    If (LEqual (NDID, 0x04))
                    {
                        Name (TMP4, Package (0x04)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP4, 0x00))
                        Store (Or (0x00010000, DID2), Index (TMP4, 0x01))
                        Store (Or (0x00010000, DID3), Index (TMP4, 0x02))
                        Store (Or (0x00010000, DID4), Index (TMP4, 0x03))
                        Return (TMP4)
                    }

                    Name (TMP5, Package (0x05)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    })
                    Store (Or (0x00010000, DID1), Index (TMP5, 0x00))
                    Store (Or (0x00010000, DID2), Index (TMP5, 0x01))
                    Store (Or (0x00010000, DID3), Index (TMP5, 0x02))
                    Store (Or (0x00010000, DID4), Index (TMP5, 0x03))
                    Store (Or (0x00010000, DID5), Index (TMP5, 0x04))
                    Return (TMP5)
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID1))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x01, 0x00)
                        If (And (CSTE, 0x0101))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0101))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD02)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID2))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x01, 0x00)
                        If (And (CSTE, 0x0202))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x02))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD03)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID3))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x01, 0x00)
                        If (And (CSTE, 0x0404))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0404))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID4))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x01, 0x00)
                        If (And (CSTE, 0x0808))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x0808))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD05)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        Return (And (0xFFFF, DID5))
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        PHSR (0x01, 0x00)
                        If (And (CSTE, 0x10))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (And (NSTE, 0x10))
                        {
                            Return (0x01)
                        }

                        Return (0x00)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }
            }

            Device (RP01)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (P1CS, PCI_Config, 0x40, 0x0100)
                Field (P1CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x1A), 
                    ABP1,   1, 
                        ,   2, 
                    PDC1,   1, 
                        ,   2, 
                    PDS1,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP1,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Device (PXS1)
                {
                    Name (_ADR, 0x00)
                    Name (_EJD, "_SB.PCI0.DOCK")
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (DCKS, 0x01))
                        {
                            Return (0x0F)
                        }

                        Return (0x00)
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (0x01)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (P2CS, PCI_Config, 0x40, 0x0100)
                Field (P2CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDP2,   1, 
                            Offset (0x1A), 
                    ABP2,   1, 
                        ,   2, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSP2,   1, 
                            Offset (0x9B), 
                        ,   6, 
                    Z000,   1, 
                    Z001,   1, 
                        ,   30, 
                    HPCS,   1, 
                    PMCS,   1
                }

                Method (_INI, 0, NotSerialized)
                {
                    And (RBEC (0x71), 0x04, Local0)
                    If (LOr (LEqual (\_SB.PCI0.RP02.PXHA.PDID, 0x032C), LEqual (Local0, 0x00)))
                    {
                        Store (0x01, DCKS)
                    }
                    Else
                    {
                        Store (0x00, DCKS)
                        Store (0x00, \_SB.PCI0.RP02.Z000)
                        Store (0x01, \_SB.PCI0.RP02.LDP2)
                    }
                }

                Device (PXHA)
                {
                    Name (_ADR, 0x00)
                    OperationRegion (PXHR, PCI_Config, 0x00, 0xC0)
                    Field (PXHR, DWordAcc, NoLock, Preserve)
                    {
                        PVID,   16, 
                        PDID,   16
                    }

                    Name (_EJD, "_SB.PCI0.DOCK")
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (DCKS, 0x01))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_PRT, 0, NotSerialized)
                    {
                        If (GPIC)
                        {
                            Return (Package (0x09)
                            {
                                Package (0x04)
                                {
                                    0x0002FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x18
                                }, 

                                Package (0x04)
                                {
                                    0x0002FFFF, 
                                    0x01, 
                                    0x00, 
                                    0x19
                                }, 

                                Package (0x04)
                                {
                                    0x0002FFFF, 
                                    0x02, 
                                    0x00, 
                                    0x1A
                                }, 

                                Package (0x04)
                                {
                                    0x0003FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x1B
                                }, 

                                Package (0x04)
                                {
                                    0x0003FFFF, 
                                    0x01, 
                                    0x00, 
                                    0x1C
                                }, 

                                Package (0x04)
                                {
                                    0x0003FFFF, 
                                    0x02, 
                                    0x00, 
                                    0x1D
                                }, 

                                Package (0x04)
                                {
                                    0x0004FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x1E
                                }, 

                                Package (0x04)
                                {
                                    0x0005FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x1F
                                }, 

                                Package (0x04)
                                {
                                    0x0006FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x20
                                }
                            })
                        }
                        Else
                        {
                            Return (Package (0x04)
                            {
                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x00, 
                                    \_SB.PCI0.LPCB.LNKB, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x01, 
                                    \_SB.PCI0.LPCB.LNKC, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x02, 
                                    \_SB.PCI0.LPCB.LNKD, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x03, 
                                    \_SB.PCI0.LPCB.LNKA, 
                                    0x00
                                }
                            })
                        }
                    }
                }

                Scope (\_SB.PCI0)
                {
                    Device (DOCK)
                    {
                        Name (_HID, EisaId ("PNP0C15"))
                        Name (_UID, 0x01)
                        Name (_BDN, "EZ4")
                        Name (DSTS, 0x00)
                        Method (_DCK, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Store (0x00, \_SB.PCI0.RP02.Z000)
                                Store (0x01, \_SB.PCI0.RP02.LDP2)
                                Return (0x00)
                            }
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            Store (0x01, HOTS)
                            If (Arg0)
                            {
                                Store (0x00, DCKS)
                            }
                        }

                        Method (_EJ4, 1, NotSerialized)
                        {
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (\_SB.PCI0.RP02.LDP2, 0x01))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                If (LEqual (DCKS, 0x01))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x00)
                                }
                            }
                        }

                        Method (DKIN, 0, NotSerialized)
                        {
                            Store (0x01, DCKS)
                            Notify (\_SB.PCI0.DOCK, 0x00)
                            Store (0x00, \_SB.PCI0.LPCB.C4C3)
                            Store (0x00, \_SB.PCI0.RP02.LDP2)
                            Sleep (0x01F4)
                            Store (0x01, \_SB.PCI0.RP02.Z000)
                            Sleep (0x01F4)
                            \_SB.Z002 (0x07, 0x00)
                            Sleep (0x01F4)
                            Store (0x01, \_SB.PCI0.RP02.PDC2)
                            Store (0x01, \_SB.PCI0.RP02.HPCS)
                            PHSR (0x37, 0x00)
                        }

                        Method (DKOU, 0, NotSerialized)
                        {
                            Store (0x00, DCKS)
                            Store (0x01, \_SB.PCI0.LPCB.C4C3)
                            If (LEqual (\_SB.PCI0.RP02.Z000, 0x01))
                            {
                                Store (0x00, \_SB.PCI0.RP02.Z000)
                                Sleep (0x01F4)
                                Store (0x01, \_SB.PCI0.RP02.LDP2)
                                Notify (\_SB.PCI0.RP02, 0x00)
                                Sleep (0x07D0)
                            }

                            Notify (\_SB.PCI0.DOCK, 0x01)
                            PHSR (0x37, 0x00)
                        }

                        Method (DPTS, 1, NotSerialized)
                        {
                            If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
                            {
                                Store (DCKS, DSTS)
                            }
                        }

                        Method (DWAK, 1, NotSerialized)
                        {
                            If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
                            {
                                Store (\_SB.PCI0.LPCB.EC0.EZ4D, Local0)
                                If (LEqual (Local0, 0x01))
                                {
                                    Notify (\_SB.PCI0.RP02.PXHA, 0x00)
                                }

                                If (LEqual (Local0, DSTS))
                                {
                                    If (LEqual (Local0, 0x00))
                                    {
                                        If (LEqual (Arg0, 0x03))
                                        {
                                            Store (0x01, DCKS)
                                            Notify (\_SB.PCI0.DOCK, 0x00)
                                            PHSR (0x37, 0x00)
                                        }

                                        If (LEqual (Arg0, 0x04))
                                        {
                                            DKIN ()
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x03))
                                        {
                                            Store (0x00, DCKS)
                                            Notify (\_SB.PCI0.DOCK, 0x01)
                                            PHSR (0x37, 0x00)
                                        }

                                        If (LEqual (Arg0, 0x04))
                                        {
                                            Store (0x00, \_SB.PCI0.RP02.Z000)
                                            Store (0x01, \_SB.PCI0.RP02.LDP2)
                                            Store (0x01, HOTS)
                                            DKOU ()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Scope (\_SB)
                {
                    OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
                    Field (SMI0, AnyAcc, NoLock, Preserve)
                    {
                        SMIC,   8
                    }

                    OperationRegion (SMI1, SystemMemory, 0x7FEF6EBD, 0x00000090)
                    Field (SMI1, AnyAcc, NoLock, Preserve)
                    {
                        BCMD,   8, 
                        DID,    32, 
                        INF,    8
                    }

                    Mutex (PSMX, 0x00)
                    Method (Z002, 2, NotSerialized)
                    {
                        Acquire (\_SB.PSMX, 0xFFFF)
                        Store (0x90, BCMD)
                        Store (Arg0, DID)
                        Store (Arg1, INF)
                        Store (Zero, SMIC)
                        Store (INF, Local0)
                        Release (\_SB.PSMX)
                        Return (Local0)
                    }
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0000)
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0001)
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0002)
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB4)
            {
                Name (_ADR, 0x001D0003)
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (USB7)
            {
                Name (_ADR, 0x001D0007)
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Device (LANB)
                {
                    Name (_ADR, 0x00070000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x05
                    })
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x06)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x03, 
                                0x00, 
                                0x16
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x06)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x00, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x01, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x02, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0009FFFF, 
                                0x03, 
                                \_SB.PCI0.LPCB.LNKG, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (AUD0)
            {
                Name (_ADR, 0x001E0002)
            }

            Device (MODM)
            {
                Name (_ADR, 0x001E0003)
                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)
                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x20), 
                    PARC,   8, 
                    PBRC,   8, 
                    PCRC,   8, 
                    PDRC,   8, 
                            Offset (0x28), 
                    PERC,   8, 
                    PFRC,   8, 
                    PGRC,   8, 
                    PHRC,   8, 
                            Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                    Z003,   1, 
                    Z004,   1, 
                    LPTE,   1, 
                            Offset (0x60), 
                        ,   7, 
                    C4C3,   1
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PARC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0E)
                                {}
                        })
                        CreateWordField (RTLA, \_SB.PCI0.LPCB.LNKA._CRS._Y0E._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PARC, 0x0F), IRQ0)
                        Return (RTLA)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PARC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PARC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PBRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y0F)
                                {}
                        })
                        CreateWordField (RTLB, \_SB.PCI0.LPCB.LNKB._CRS._Y0F._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PBRC, 0x0F), IRQ0)
                        Return (RTLB)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PBRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PBRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PCRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y10)
                                {}
                        })
                        CreateWordField (RTLC, \_SB.PCI0.LPCB.LNKC._CRS._Y10._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PCRC, 0x0F), IRQ0)
                        Return (RTLC)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PCRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PCRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PDRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y11)
                                {}
                        })
                        CreateWordField (RTLD, \_SB.PCI0.LPCB.LNKD._CRS._Y11._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PDRC, 0x0F), IRQ0)
                        Return (RTLD)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PDRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PDRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PERC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLE, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y12)
                                {}
                        })
                        CreateWordField (RTLE, \_SB.PCI0.LPCB.LNKE._CRS._Y12._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PERC, 0x0F), IRQ0)
                        Return (RTLE)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PERC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PERC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PFRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLF, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y13)
                                {}
                        })
                        CreateWordField (RTLF, \_SB.PCI0.LPCB.LNKF._CRS._Y13._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PFRC, 0x0F), IRQ0)
                        Return (RTLF)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PFRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PFRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PGRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLG, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y14)
                                {}
                        })
                        CreateWordField (RTLG, \_SB.PCI0.LPCB.LNKG._CRS._Y14._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PGRC, 0x0F), IRQ0)
                        Return (RTLG)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PGRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PGRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PHRC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {10,11}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLH, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, _Y15)
                                {}
                        })
                        CreateWordField (RTLH, \_SB.PCI0.LPCB.LNKH._CRS._Y15._INT, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (0x01, And (PHRC, 0x0F), IRQ0)
                        Return (RTLH)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PHRC)
                    }

                    Method (_STA, 0, Serialized)
                    {
                        If (And (PHRC, 0x80))
                        {
                            Return (0x09)
                        }
                        Else
                        {
                            Return (0x0B)
                        }
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x17)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                    OperationRegion (ECO1, SystemIO, 0x62, 0x01)
                    Field (ECO1, ByteAcc, Lock, Preserve)
                    {
                        PX62,   8
                    }

                    OperationRegion (ECO2, SystemIO, 0x66, 0x01)
                    Field (ECO2, ByteAcc, Lock, Preserve)
                    {
                        PX66,   8
                    }

                    OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x0A), 
                            ,   1, 
                        BLNK,   1, 
                                Offset (0x50), 
                            ,   2, 
                        TBLT,   1, 
                                Offset (0x51), 
                            ,   7, 
                        BYPW,   1, 
                                Offset (0x70), 
                            ,   1, 
                        KLID,   1, 
                            ,   3, 
                        KACS,   1, 
                                Offset (0x71), 
                            ,   2, 
                        EZ4D,   1, 
                            ,   1, 
                        KBID,   3, 
                                Offset (0x72), 
                            ,   2, 
                        KEYW,   1, 
                        TPDW,   1, 
                        LIDW,   1, 
                        BL2W,   1
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x01), 
                        TIID,   8, 
                                Offset (0x10), 
                            ,   1, 
                        KTEE,   1, 
                                Offset (0x11), 
                        KPPS,   1, 
                                Offset (0x91), 
                        TTID,   8, 
                        KCSS,   1, 
                        KCTT,   1, 
                        KDTT,   1, 
                        KOSD,   1, 
                        KVTP,   1, 
                                Offset (0xA8), 
                        THS0,   8, 
                        THS1,   8, 
                        THS2,   8, 
                        THS3,   8, 
                        THS4,   8, 
                        THS5,   8, 
                        THS6,   8, 
                        THS7,   8
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x92), 
                        KTAF,   8
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x92), 
                        THSL,   4
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0xD8), 
                        TS2H,   8, 
                        TS3L,   8, 
                        TS3H,   8, 
                        TS4L,   8, 
                        TS4H,   8, 
                        TS5L,   8, 
                        TS5H,   8, 
                        TS6,    8
                    }

                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECON)
                        }
                    }

                    Method (_Q16, 0, NotSerialized)
                    {
                        Store (0x16, P80H)
                        HKEY (0x16)
                    }

                    Method (_Q24, 0, NotSerialized)
                    {
                        Store (0x24, P80H)
                        HKEY (0x24)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Store (0x25, P80H)
                        HKEY (0x25)
                    }

                    Method (_Q17, 0, NotSerialized)
                    {
                        Store (0x17, P80H)
                        Notify (\_SB.SLPB, 0x80)
                    }

                    Method (_Q19, 0, NotSerialized)
                    {
                        Store (0x19, P80H)
                        HKDS (0x0A)
                    }

                    Method (_Q80, 0, NotSerialized)
                    {
                        Store (0x80, P80H)
                        HKDS (0x00)
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        Store (0x81, P80H)
                        HKDS (0x01)
                    }

                    Method (_Q82, 0, NotSerialized)
                    {
                        Store (0x82, P80H)
                        HKDS (0x02)
                    }

                    Method (_Q1A, 0, NotSerialized)
                    {
                        Store (0x1A, P80H)
                        HKEY (0x1A)
                    }

                    Method (_Q5C, 0, NotSerialized)
                    {
                        Store (0x5C, P80H)
                        HKEY (0x5C)
                    }

                    Method (_Q1E, 0, NotSerialized)
                    {
                        Store (0x1E, P80H)
                        HKEY (0x1E)
                    }

                    Method (_Q1F, 0, NotSerialized)
                    {
                        Store (0x1F, P80H)
                        HKEY (0x1F)
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Store (0x22, P80H)
                        HKEY (0x22)
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0x10, P80H)
                        HKEY (0x10)
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x11, P80H)
                        HKEY (0x11)
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x12, P80H)
                        HKEY (0x12)
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Store (0x13, P80H)
                        HKEY (0x13)
                    }

                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (0x14, P80H)
                        HKEY (0x14)
                    }

                    Method (_Q15, 0, NotSerialized)
                    {
                        Store (0x15, P80H)
                        HKEY (0x15)
                    }

                    Method (_Q1B, 0, NotSerialized)
                    {
                        Store (0x1B, P80H)
                        HKEY (0x1B)
                    }

                    Method (_Q23, 0, NotSerialized)
                    {
                        Store (0x23, P80H)
                        HKEY (0x23)
                    }

                    Method (_Q30, 0, NotSerialized)
                    {
                        Store (0x30, P80H)
                        Store (0x01, KDTT)
                    }

                    Method (_Q31, 0, NotSerialized)
                    {
                        Store (0x31, P80H)
                        Store (0x00, KDTT)
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x32, P80H)
                        Store (0x00, KCTT)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, P80H)
                        Store (0x00, KCSS)
                        Notify (\_TZ.TZS0, 0x80)
                        Notify (\_TZ.TZS1, 0x80)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, P80H)
                        Store (0x01, KCSS)
                        Notify (\_TZ.TZS0, 0x80)
                        Notify (\_TZ.TZS1, 0x80)
                    }

                    Method (_Q35, 0, NotSerialized)
                    {
                        Store (0x35, P80H)
                        Store (0x01, KCTT)
                    }

                    Method (Z005, 0, NotSerialized)
                    {
                        Store (0x36, P80H)
                        Store (0x01, KOSD)
                        Sleep (0x01F4)
                        Notify (\_TZ.TZS0, 0x80)
                        Notify (\_TZ.TZS1, 0x80)
                    }

                    Method (_Q40, 0, NotSerialized)
                    {
                        Store (0x40, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
                    }

                    Method (_Q41, 0, NotSerialized)
                    {
                        Store (0x41, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x81)
                    }

                    Method (_Q48, 0, NotSerialized)
                    {
                        Store (0x48, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x80)
                    }

                    Method (_Q42, 0, NotSerialized)
                    {
                        Store (0x42, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT1, 0x81)
                    }

                    Method (_Q43, 0, NotSerialized)
                    {
                        Store (0x43, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT1, 0x81)
                    }

                    Method (_Q49, 0, NotSerialized)
                    {
                        Store (0x49, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.BAT1, 0x80)
                    }

                    Method (_Q4C, 0, NotSerialized)
                    {
                        Store (0x4C, P80H)
                        If (B0ST)
                        {
                            Notify (\_SB.PCI0.LPCB.EC0.BAT0, 0x80)
                        }

                        If (B1ST)
                        {
                            Notify (\_SB.PCI0.LPCB.EC0.BAT1, 0x80)
                        }
                    }

                    Method (_Q50, 0, NotSerialized)
                    {
                        Store (0x50, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.ADP1, 0x80)
                    }

                    Method (_Q51, 0, NotSerialized)
                    {
                        Store (0x51, P80H)
                        Notify (\_SB.PCI0.LPCB.EC0.ADP1, 0x80)
                    }

                    Method (_Q52, 0, NotSerialized)
                    {
                        Store (0x52, P80H)
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (_Q53, 0, NotSerialized)
                    {
                        Store (0x53, P80H)
                        Notify (\_SB.LID0, 0x80)
                    }

                    Method (_Q54, 0, NotSerialized)
                    {
                        Store (0x54, P80H)
                        HKEY (0x54)
                    }

                    Method (_Q55, 0, NotSerialized)
                    {
                        Store (0x55, P80H)
                        HKEY (0x55)
                    }

                    Method (_Q56, 0, NotSerialized)
                    {
                        Store (0x56, P80H)
                        \_SB.PCI0.DOCK.DKIN ()
                    }

                    Method (_Q57, 0, NotSerialized)
                    {
                        Store (0x57, P80H)
                        \_SB.PCI0.DOCK.DKOU ()
                    }

                    Method (_Q58, 0, NotSerialized)
                    {
                        Store (0x58, P80H)
                        \_SB.PCI0.PATA.PRID.P_D1.BYIN ()
                    }

                    Method (_Q59, 0, NotSerialized)
                    {
                        Store (0x59, P80H)
                        \_SB.PCI0.PATA.PRID.P_D1.BYOU ()
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x02), 
                        NBID,   8, 
                                Offset (0x88), 
                        NB0A,   1, 
                            ,   3, 
                        NBL2,   1, 
                                Offset (0x89), 
                        NB1A,   1
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x88), 
                        NB0S,   8, 
                        NB1S,   8
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0xE0), 
                        BSRC,   16, 
                        BSFC,   16, 
                        BSPE,   16, 
                        BSAC,   16, 
                        BSVO,   16, 
                            ,   15, 
                        BSCM,   1, 
                        BSCU,   16, 
                        BSBS,   8
                    }

                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0xE0), 
                        BSDC,   16, 
                        BSDV,   16, 
                        BSSN,   16
                    }

                    Field (RAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0xE0), 
                        BSMN,   128
                    }

                    Field (RAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0xE0), 
                        BSDN,   128
                    }

                    Field (RAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0xE0), 
                        BSCH,   64, 
                        BSMF,   64
                    }

                    Mutex (BATM, 0x07)
                    Method (GBIF, 3, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If (Arg2)
                        {
                            Store (0xFFFFFFFF, Index (Arg1, 0x01))
                            Store (0xFFFFFFFF, Index (Arg1, 0x02))
                            Store (0xFFFFFFFF, Index (Arg1, 0x04))
                            Store (0x00, Index (Arg1, 0x05))
                            Store (0x00, Index (Arg1, 0x06))
                        }
                        Else
                        {
                            Store (Arg0, NBID)
                            Store (BSCM, Local0)
                            XOr (Local0, 0x01, Index (Arg1, 0x00))
                            Or (Arg0, 0x01, NBID)
                            If (Local0)
                            {
                                Multiply (BSDC, 0x0A, Local1)
                            }
                            Else
                            {
                                Store (BSDC, Local1)
                            }

                            Store (Local1, Index (Arg1, 0x01))
                            And (Arg0, 0xF0, NBID)
                            If (Local0)
                            {
                                Multiply (BSFC, 0x0A, Local2)
                            }
                            Else
                            {
                                Store (BSFC, Local2)
                            }

                            Store (Local2, Index (Arg1, 0x02))
                            Or (Arg0, 0x01, NBID)
                            Store (BSDV, Index (Arg1, 0x04))
                            Divide (Local2, 0x64, Local7, Local6)
                            Multiply (Local6, 0x05, Local3)
                            Store (Local3, Index (Arg1, 0x05))
                            Multiply (Local6, 0x03, Local4)
                            Store (Local4, Index (Arg1, 0x06))
                            Subtract (Local3, Local4, Index (Arg1, 0x07))
                            Subtract (Local2, Local3, Index (Arg1, 0x08))
                            Or (Arg0, 0x01, NBID)
                            Store (BSSN, Local7)
                            Name (SERN, Buffer (0x06)
                            {
                                "     "
                            })
                            Store (0x04, Local6)
                            While (Local7)
                            {
                                Divide (Local7, 0x0A, Local5, Local7)
                                Add (Local5, 0x30, Index (SERN, Local6))
                                Decrement (Local6)
                            }

                            Store (SERN, Index (Arg1, 0x0A))
                            Or (Arg0, 0x03, NBID)
                            Store (BSDN, Index (Arg1, 0x09))
                            And (Arg0, 0xF0, NBID)
                            Or (Arg0, 0x04, NBID)
                            Store (BSCH, Index (Arg1, 0x0B))
                            And (Arg0, 0xF0, NBID)
                            Or (Arg0, 0x02, NBID)
                            Store (BSMN, Index (Arg1, 0x0C))
                        }

                        Release (BATM)
                        Return (Arg1)
                    }

                    Method (GBST, 4, NotSerialized)
                    {
                        Acquire (BATM, 0xFFFF)
                        If (And (Arg1, 0x02))
                        {
                            Store (0x02, Local0)
                        }
                        Else
                        {
                            If (And (Arg1, 0x04))
                            {
                                Store (0x01, Local0)
                            }
                            Else
                            {
                                Store (0x00, Local0)
                            }
                        }

                        If (NBL2)
                        {
                            Or (Local0, 0x04, Local0)
                        }

                        If (And (Arg1, 0x01))
                        {
                            And (Arg0, 0xF0, NBID)
                            Store (BSAC, Local1)
                            If (Arg2)
                            {
                                Multiply (BSRC, 0x0A, Local2)
                            }
                            Else
                            {
                                Store (BSRC, Local2)
                            }

                            Store (BSVO, Local3)
                            If (LGreaterEqual (Local1, 0x8000))
                            {
                                If (And (Local0, 0x01))
                                {
                                    Subtract (0x00010000, Local1, Local1)
                                }
                                Else
                                {
                                    Store (0x00, Local1)
                                }
                            }
                            Else
                            {
                                If (LEqual (And (Local0, 0x02), 0x00))
                                {
                                    Store (0x00, Local1)
                                }
                            }

                            If (Arg2)
                            {
                                Multiply (Local3, Local1, Local1)
                                Divide (Local1, 0x03E8, Local7, Local1)
                            }
                        }
                        Else
                        {
                            Store (0x00, Local0)
                            Store (0xFFFFFFFF, Local1)
                            Store (0xFFFFFFFF, Local2)
                            Store (0xFFFFFFFF, Local3)
                        }

                        Store (Local0, Index (Arg3, 0x00))
                        Store (Local1, Index (Arg3, 0x01))
                        Store (Local2, Index (Arg3, 0x02))
                        Store (Local3, Index (Arg3, 0x03))
                        Release (BATM)
                        Return (Arg3)
                    }

                    Name (B0ST, 0x00)
                    Device (BAT0)
                    {
                        Name (_HID, EisaId ("PNP0C0A"))
                        Name (_UID, 0x01)
                        Method (_PCL, 0, NotSerialized)
                        {
                            Return (\_SB)
                        }

                        Name (B0IP, Package (0x0D)
                        {
                            0x01, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0x01, 
                            0xFFFFFFFF, 
                            0x00, 
                            0x00, 
                            0x5A, 
                            0x5A, 
                            "", 
                            "100", 
                            "Lion", 
                            0x00
                        })
                        Name (B0SP, Package (0x04)
                        {
                            0x00, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (\ECON)
                            {
                                Store (NB0A, Local1)
                            }
                            Else
                            {
                                ShiftRight (RBEC (0x88), 0x00, Local0)
                                And (Local0, 0x01, Local1)
                            }

                            Store (Local1, B0ST)
                            If (Local1)
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
                            If (\ECON)
                            {
                                Store (NB0A, Local0)
                            }
                            Else
                            {
                                ShiftRight (RBEC (0x88), 0x00, Local0)
                            }

                            And (Local0, 0x01, Local6)
                            Store (0x14, Local7)
                            While (LAnd (Local6, Local7))
                            {
                                If (\ECON)
                                {
                                    Store (NB0S, Local1)
                                }
                                Else
                                {
                                    Store (RBEC (0x88), Local1)
                                }

                                If (And (Local1, 0x08))
                                {
                                    Store (0x00, Local6)
                                }
                                Else
                                {
                                    Sleep (0x01F4)
                                    Decrement (Local7)
                                }
                            }

                            Return (GBIF (0x00, B0IP, Local6))
                        }

                        Method (_BST, 0, NotSerialized)
                        {
                            XOr (DerefOf (Index (B0IP, 0x00)), 0x01, Local0)
                            If (\ECON)
                            {
                                Store (NB0S, Local1)
                            }
                            Else
                            {
                                Store (RBEC (0x88), Local1)
                            }

                            Return (GBST (0x00, Local1, Local0, B0SP))
                        }
                    }

                    Name (B1ST, 0x00)
                    Device (BAT1)
                    {
                        Name (_HID, EisaId ("PNP0C0A"))
                        Name (_UID, 0x02)
                        Method (_PCL, 0, NotSerialized)
                        {
                            Return (\_SB)
                        }

                        Name (B1IP, Package (0x0D)
                        {
                            0x01, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0x01, 
                            0xFFFFFFFF, 
                            0x00, 
                            0x00, 
                            0x5A, 
                            0x5A, 
                            "", 
                            "100", 
                            "Lion", 
                            0x00
                        })
                        Name (B1SP, Package (0x04)
                        {
                            0x00, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (\ECON)
                            {
                                Store (NB1A, Local1)
                            }
                            Else
                            {
                                ShiftRight (RBEC (0x89), 0x00, Local0)
                                And (Local0, 0x01, Local1)
                            }

                            Store (Local1, B1ST)
                            If (Local1)
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
                            If (\ECON)
                            {
                                Store (NB1A, Local6)
                            }
                            Else
                            {
                                ShiftRight (RBEC (0x89), 0x00, Local0)
                                And (Local0, 0x01, Local6)
                            }

                            Store (0x14, Local7)
                            While (LAnd (Local6, Local7))
                            {
                                If (\ECON)
                                {
                                    Store (NB1S, Local1)
                                }
                                Else
                                {
                                    Store (RBEC (0x89), Local1)
                                }

                                If (And (Local1, 0x08))
                                {
                                    Store (0x00, Local6)
                                }
                                Else
                                {
                                    Sleep (0x01F4)
                                    Decrement (Local7)
                                }
                            }

                            Return (GBIF (0x10, B1IP, Local6))
                        }

                        Method (_BST, 0, NotSerialized)
                        {
                            XOr (DerefOf (Index (B1IP, 0x00)), 0x01, Local0)
                            If (\ECON)
                            {
                                Store (NB1S, Local1)
                            }
                            Else
                            {
                                Store (RBEC (0x89), Local1)
                            }

                            Return (GBST (0x10, Local1, Local0, B1SP))
                        }
                    }

                    Name (ACST, 0x01)
                    Device (ADP1)
                    {
                        Name (_HID, "ACPI0003")
                        Method (_PSR, 0, NotSerialized)
                        {
                            If (ECON)
                            {
                                Store (KACS, Local1)
                            }
                            Else
                            {
                                Store (RBEC (0x70), Local0)
                                And (Local0, 0x20, Local1)
                            }

                            If (Local1)
                            {
                                Store (0x01, ACST)
                            }
                            Else
                            {
                                Store (0x00, ACST)
                            }

                            Return (ACST)
                        }

                        Method (_PCL, 0, NotSerialized)
                        {
                            Return (\_SB)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF800000,         // Address Base
                            0x00800000,         // Address Length
                            )
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y16)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
                        {
                            If (HPAE)
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            If (HPAE)
                            {
                                Return (0x0B)
                            }
                        }

                        Return (0x00)
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPCB.HPET._Y16._BAS, HPT0)
                            If (LEqual (HPAS, 0x01))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (HPAS, 0x02))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (HPAS, 0x03))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (MBD0)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x01)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
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
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0680,             // Range Minimum
                            0x0680,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        IO (Decode16,
                            0x1200,             // Range Minimum
                            0x1200,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x1204,             // Range Minimum
                            0x1204,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xF0000000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xF0004000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xF0005000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xF0008000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEC18000,         // Address Base
                            0x00000100,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED20000,         // Address Base
                            0x00070000,         // Address Length
                            )
                    })
                }

                Device (MBD1)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x02)
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0xFEC00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFEE00000,         // Address Base
                            0x00001000,         // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LLessEqual (OSYS, 0x07CF))
                        {
                            If (LOr (APIC, HTTE))
                            {
                                Return (0x0B)
                            }
                        }

                        Return (0x00)
                    }
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (N393)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, Serialized)
                    {
                        If (NATP)
                        {
                            Return (0x0F)
                        }

                        Return (0x00)
                    }

                    OperationRegion (N393, SystemIO, 0x2E, 0x02)
                    Field (N393, ByteAcc, Lock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    IndexField (INDX, DATA, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x07), 
                        R07H,   8, 
                                Offset (0x20), 
                        R20H,   8, 
                        R21H,   8, 
                        R22H,   8, 
                        R23H,   8, 
                        R24H,   8, 
                        R25H,   8, 
                        R26H,   8, 
                        R27H,   8, 
                        R28H,   8, 
                        R29H,   8, 
                        R2AH,   8, 
                                Offset (0x30), 
                        R30H,   8, 
                                Offset (0x60), 
                        R60H,   8, 
                        R61H,   8, 
                                Offset (0x70), 
                        R70H,   8, 
                        R71H,   8, 
                                Offset (0x74), 
                        R74H,   8, 
                        R75H,   8, 
                                Offset (0xF0), 
                        RF0H,   8, 
                        RF1H,   8
                    }

                    Device (DGTZ)
                    {
                        Name (_HID, EisaId ("WACF004"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, Serialized)
                        {
                            Store (0x03, R07H)
                            If (R30H)
                            {
                                Return (0x0F)
                            }

                            Return (0x0D)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x03, R07H)
                            Store (0x00, R30H)
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x06F8,             // Range Minimum
                                    0x06F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y17)
                                IRQNoFlags (_Y18)
                                    {6}
                            })
                            Store (0x03, R07H)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.DGTZ._CRS._Y17._MIN, IOL0)
                            CreateByteField (BUF0, 0x03, IOH0)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.DGTZ._CRS._Y17._MAX, IOL1)
                            CreateByteField (BUF0, 0x05, IOH1)
                            CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.DGTZ._CRS._Y17._LEN, LEN0)
                            CreateWordField (BUF0, \_SB.PCI0.LPCB.N393.DGTZ._CRS._Y18._INT, IRQW)
                            Store (R60H, IOH0)
                            Store (R61H, IOL0)
                            Store (R60H, IOH1)
                            Store (R61H, IOL1)
                            Store (0x08, LEN0)
                            And (R70H, 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, IRQW)
                            }
                            Else
                            {
                                Store (Zero, IRQW)
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x06F8,             // Range Minimum
                                        0x06F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {6}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x06F0,             // Range Minimum
                                        0x06F0,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x06E8,             // Range Minimum
                                        0x06E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x06E0,             // Range Minimum
                                        0x06E0,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateWordField (Arg0, 0x09, IRQW)
                            Store (0x03, R07H)
                            Store (0x00, R30H)
                            Store (IOLO, R61H)
                            Store (IOHI, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            Store (0x01, R30H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x03, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x03, R07H)
                            Store (0x00, R30H)
                        }
                    }

                    Device (POUT)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            If (LEqual (And (RF0H, 0xE0), 0x00))
                            {
                                If (LAnd (NATP, LPTP))
                                {
                                    Store (0x01, R07H)
                                    If (R30H)
                                    {
                                        Return (0x0F)
                                    }

                                    Return (0x0D)
                                }
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            If (LEqual (And (RF0H, 0xE0), 0x00))
                            {
                                Store (0x00, R30H)
                            }
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    _Y19)
                                IRQNoFlags (_Y1A)
                                    {7}
                            })
                            If (LEqual (And (RF0H, 0xE0), 0x00))
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.POUT._CRS._Y19._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.POUT._CRS._Y19._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.POUT._CRS._Y19._LEN, LEN0)
                                CreateWordField (BUF0, \_SB.PCI0.LPCB.N393.POUT._CRS._Y1A._INT, IRQW)
                                Store (0x01, R07H)
                                Store (R61H, IOL0)
                                Store (R60H, IOH0)
                                Store (IOL0, IOL1)
                                Store (IOH0, IOH1)
                                Store (0x04, LEN0)
                                If (And (R70H, 0x0F))
                                {
                                    ShiftLeft (One, And (R70H, 0x0F), IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03BC,             // Range Minimum
                                        0x03BC,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03BC,             // Range Minimum
                                        0x03BC,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOL0)
                            CreateByteField (Arg0, 0x03, IOH0)
                            CreateWordField (Arg0, 0x09, IRQW)
                            Store (0x01, R07H)
                            Store (0x00, R30H)
                            And (RF0H, 0x0F, RF0H)
                            Store (0x04, R74H)
                            Store (IOL0, R61H)
                            Store (IOH0, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            And (IOD1, 0xFC, IOD1)
                            If (LEqual (IOH0, 0x03))
                            {
                                If (LEqual (IOL0, 0x78))
                                {
                                    Or (IOD1, 0x00, IOD1)
                                }
                                Else
                                {
                                    Or (IOD1, 0x02, IOD1)
                                }
                            }
                            Else
                            {
                                Or (IOD1, 0x01, IOD1)
                            }

                            Store (0x01, R30H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            Store (0x00, R30H)
                        }
                    }

                    Device (PBID)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x02)
                        Method (_STA, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            If (LEqual (And (RF0H, 0xE0), 0x20))
                            {
                                If (LAnd (NATP, LPTP))
                                {
                                    If (R30H)
                                    {
                                        Return (0x0F)
                                    }

                                    Return (0x0D)
                                }
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            If (LEqual (And (RF0H, 0xE0), 0x20))
                            {
                                Store (0x00, R30H)
                            }
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    _Y1B)
                                IRQNoFlags (_Y1C)
                                    {7}
                            })
                            If (LEqual (And (RF0H, 0xE0), 0x20))
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PBID._CRS._Y1B._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PBID._CRS._Y1B._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PBID._CRS._Y1B._LEN, LEN0)
                                CreateWordField (BUF0, \_SB.PCI0.LPCB.N393.PBID._CRS._Y1C._INT, IRQW)
                                Store (0x01, R07H)
                                Store (R61H, IOL0)
                                Store (R60H, IOH0)
                                Store (IOL0, IOL1)
                                Store (IOH0, IOH1)
                                Store (0x04, LEN0)
                                If (And (R70H, 0x0F))
                                {
                                    ShiftLeft (One, And (R70H, 0x0F), IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03BC,             // Range Minimum
                                        0x03BC,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03BC,             // Range Minimum
                                        0x03BC,             // Range Maximum
                                        0x01,               // Alignment
                                        0x04,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOL0)
                            CreateByteField (Arg0, 0x03, IOH0)
                            CreateWordField (Arg0, 0x09, IRQW)
                            Store (0x01, R07H)
                            Store (0x00, R30H)
                            Or (And (RF0H, 0x0F), 0x20, RF0H)
                            Store (0x04, R74H)
                            Store (IOL0, R61H)
                            Store (IOH0, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            And (IOD1, 0xFC, IOD1)
                            If (LEqual (IOH0, 0x03))
                            {
                                If (LEqual (IOL0, 0x78))
                                {
                                    Or (IOD1, 0x00, IOD1)
                                }
                                Else
                                {
                                    Or (IOD1, 0x02, IOD1)
                                }
                            }
                            Else
                            {
                                Or (IOD1, 0x01, IOD1)
                            }

                            Store (0x01, R30H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            Store (0x00, R30H)
                        }
                    }

                    Device (PEPP)
                    {
                        Name (_HID, EisaId ("PNP0400"))
                        Name (_UID, 0x03)
                        Method (_STA, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            If (LEqual (And (RF0H, 0xE0), 0x60))
                            {
                                If (LAnd (NATP, LPTP))
                                {
                                    If (R30H)
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (0x0D)
                                    }
                                }
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            If (LEqual (And (RF0H, 0xE0), 0x60))
                            {
                                Store (0x00, R30H)
                            }
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y1D)
                                IRQNoFlags (_Y1E)
                                    {7}
                            })
                            If (LEqual (And (RF0H, 0xE0), 0x60))
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PEPP._CRS._Y1D._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PEPP._CRS._Y1D._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PEPP._CRS._Y1D._LEN, LEN0)
                                CreateWordField (BUF0, \_SB.PCI0.LPCB.N393.PEPP._CRS._Y1E._INT, IRQW)
                                Store (0x01, R07H)
                                Store (R61H, IOL0)
                                Store (R60H, IOH0)
                                Store (IOL0, IOL1)
                                Store (IOH0, IOH1)
                                Store (0x08, LEN0)
                                If (And (R70H, 0x0F))
                                {
                                    ShiftLeft (One, And (R70H, 0x0F), IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {7}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0378,             // Range Minimum
                                        0x0378,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x0278,             // Range Minimum
                                        0x0278,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {5}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOL0)
                            CreateByteField (Arg0, 0x03, IOH0)
                            CreateWordField (Arg0, 0x09, IRQW)
                            Store (0x01, R07H)
                            Store (0x00, R30H)
                            Or (And (RF0H, 0x0F), 0x60, RF0H)
                            Store (0x04, R74H)
                            Store (IOL0, R61H)
                            Store (IOH0, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            And (IOD1, 0xFC, IOD1)
                            If (LEqual (IOH0, 0x03))
                            {
                                Or (IOD1, 0x00, IOD1)
                            }
                            Else
                            {
                                Or (IOD1, 0x01, IOD1)
                            }

                            Store (0x01, R30H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            Store (0x00, R30H)
                        }
                    }

                    Device (PECP)
                    {
                        Name (_HID, EisaId ("PNP0401"))
                        Name (_UID, 0x04)
                        Method (_STA, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            If (LEqual (And (RF0H, 0xE0), 0xE0))
                            {
                                If (LAnd (NATP, LPTP))
                                {
                                    If (R30H)
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (0x0D)
                                    }
                                }
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            If (LEqual (And (RF0H, 0xE0), 0xE0))
                            {
                                Store (0x00, R30H)
                            }
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y1F)
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y20)
                                IRQNoFlags (_Y21)
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8_16, _Y22)
                                    {1}
                            })
                            If (LEqual (And (RF0H, 0xE0), 0xE0))
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PECP._CRS._Y1F._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PECP._CRS._Y1F._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PECP._CRS._Y1F._LEN, LEN0)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PECP._CRS._Y20._MIN, IOL2)
                                CreateByteField (BUF0, 0x0B, IOH2)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PECP._CRS._Y20._MAX, IOL3)
                                CreateByteField (BUF0, 0x0D, IOH3)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PECP._CRS._Y20._LEN, LEN1)
                                CreateWordField (BUF0, \_SB.PCI0.LPCB.N393.PECP._CRS._Y21._INT, IRQW)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.PECP._CRS._Y22._DMA, DMA0)
                                Store (0x01, R07H)
                                Store (R61H, IOL0)
                                Store (R60H, IOH0)
                                Store (IOL0, IOL1)
                                Store (IOH0, IOH1)
                                Store (IOL0, IOL2)
                                Store (Add (0x04, IOH0), IOH2)
                                Store (IOL0, IOL3)
                                Store (Add (0x04, IOH0), IOH3)
                                Store (0x08, LEN0)
                                Store (0x08, LEN1)
                                And (R70H, 0x0F, Local0)
                                If (Local0)
                                {
                                    ShiftLeft (One, Local0, IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }

                                Store (R74H, Local0)
                                If (LEqual (Local0, 0x04))
                                {
                                    Store (Zero, DMA0)
                                }
                                Else
                                {
                                    ShiftLeft (One, Local0, DMA0)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
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
                                        {7}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
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
                                        {7}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
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
                                        {5}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
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
                                        {5}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
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
                                        {7}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
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
                                        {7}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
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
                                        {5}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
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
                                        {5}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOL0)
                            CreateByteField (Arg0, 0x03, IOH0)
                            CreateWordField (Arg0, 0x11, IRQW)
                            CreateByteField (Arg0, 0x14, DMA0)
                            Store (0x01, R07H)
                            Store (0x00, R30H)
                            Or (RF0H, 0xF0, RF0H)
                            Store (IOL0, R61H)
                            Store (IOH0, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            FindSetRightBit (DMA0, Local0)
                            If (LNotEqual (DMA0, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R74H)
                            And (IOD1, 0xFC, IOD1)
                            If (LEqual (IOH0, 0x03))
                            {
                                Or (IOD1, 0x00, IOD1)
                            }
                            Else
                            {
                                Or (IOD1, 0x01, IOD1)
                            }

                            Store (0x01, R30H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x01, R07H)
                            Store (0x00, R30H)
                        }
                    }

                    Name (CMBF, 0xFF)
                    Method (CMBM, 0, NotSerialized)
                    {
                        If (LEqual (CMBF, 0xFF))
                        {
                            Store (0x02, R07H)
                            And (R74H, 0x07, Local0)
                            XOr (R26H, 0x04, Local1)
                            If (Local1)
                            {
                                If (LEqual (Local0, 0x04))
                                {
                                    Store (0x01, CMBF)
                                }
                                Else
                                {
                                    Store (0x02, CMBF)
                                }
                            }
                            Else
                            {
                                Store (0x00, CMBF)
                            }
                        }

                        Return (CMBF)
                    }

                    Device (COMB)
                    {
                        Name (_HID, EisaId ("PNP0501"))
                        Name (_UID, 0x03)
                        Method (_STA, 0, Serialized)
                        {
                            If (LAnd (LAnd (NATP, CMBP), LEqual (CMBM (), 0x01)))
                            {
                                Store (0x02, R07H)
                                If (R30H)
                                {
                                    Return (0x0F)
                                }

                                Return (0x0D)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y23)
                                IRQNoFlags (_Y24)
                                    {3}
                            })
                            Store (0x02, R07H)
                            If (LAnd (LAnd (NATP, CMBP), LEqual (CMBM (), 0x01)))
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.COMB._CRS._Y23._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.COMB._CRS._Y23._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.COMB._CRS._Y23._LEN, LEN0)
                                CreateWordField (BUF0, \_SB.PCI0.LPCB.N393.COMB._CRS._Y24._INT, IRQW)
                                Store (R60H, IOH0)
                                Store (R61H, IOL0)
                                Store (R60H, IOH1)
                                Store (R61H, IOL1)
                                Store (0x08, LEN0)
                                And (R70H, 0x0F, Local0)
                                If (Local0)
                                {
                                    ShiftLeft (One, Local0, IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateWordField (Arg0, 0x09, IRQW)
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                            Store (IOLO, R61H)
                            Store (IOHI, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            And (IOD0, 0x8F, IOD0)
                            If (LEqual (IOHI, 0x03))
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x00, IOD0)
                                }
                                Else
                                {
                                    Or (IOD0, 0x70, IOD0)
                                }
                            }
                            Else
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x10, IOD0)
                                }
                                Else
                                {
                                    Or (IOD0, 0x50, IOD0)
                                }
                            }

                            Store (0x01, R30H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("NSC6001"))
                        Name (_UID, 0x01)
                        Method (_STA, 0, Serialized)
                        {
                            If (LAnd (LAnd (NATP, CMBP), LEqual (CMBM (), 0x02)))
                            {
                                Store (0x02, R07H)
                                If (R30H)
                                {
                                    Return (0x0F)
                                }

                                Return (0x0D)
                            }

                            Return (0x00)
                        }

                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }

                        Method (_CRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y25)
                                IRQNoFlags (_Y26)
                                    {3}
                                DMA (Compatibility, NotBusMaster, Transfer8_16, _Y27)
                                    {3}
                            })
                            Store (0x02, R07H)
                            If (LAnd (LAnd (NATP, CMBP), LEqual (CMBM (), 0x02)))
                            {
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y25._MIN, IOL0)
                                CreateByteField (BUF0, 0x03, IOH0)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y25._MAX, IOL1)
                                CreateByteField (BUF0, 0x05, IOH1)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y25._LEN, LEN0)
                                CreateWordField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y26._INT, IRQW)
                                CreateByteField (BUF0, \_SB.PCI0.LPCB.N393.FIR._CRS._Y27._DMA, DMA0)
                                Store (R60H, IOH0)
                                Store (R61H, IOL0)
                                Store (R60H, IOH1)
                                Store (R61H, IOL1)
                                Store (0x08, LEN0)
                                And (R70H, 0x0F, Local0)
                                If (Local0)
                                {
                                    ShiftLeft (One, Local0, IRQW)
                                }
                                Else
                                {
                                    Store (Zero, IRQW)
                                }

                                Store (R74H, Local0)
                                If (LEqual (Local0, 0x04))
                                {
                                    Store (Zero, DMA0)
                                }
                                Else
                                {
                                    ShiftLeft (One, Local0, DMA0)
                                }
                            }

                            Return (BUF0)
                        }

                        Method (_PRS, 0, Serialized)
                        {
                            Name (BUF0, ResourceTemplate ()
                            {
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {3}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02E8,             // Range Minimum
                                        0x02E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x02F8,             // Range Minimum
                                        0x02F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03E8,             // Range Minimum
                                        0x03E8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                StartDependentFn (0x00, 0x02)
                                {
                                    IO (Decode16,
                                        0x03F8,             // Range Minimum
                                        0x03F8,             // Range Maximum
                                        0x01,               // Alignment
                                        0x08,               // Length
                                        )
                                    IRQNoFlags ()
                                        {4}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {1}
                                }
                                EndDependentFn ()
                            })
                            Return (BUF0)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateWordField (Arg0, 0x09, IRQW)
                            CreateByteField (Arg0, 0x0C, DMA0)
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                            Store (IOLO, R61H)
                            Store (IOHI, R60H)
                            FindSetRightBit (IRQW, Local0)
                            If (LNotEqual (IRQW, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R70H)
                            FindSetRightBit (DMA0, Local0)
                            If (LNotEqual (DMA0, Zero))
                            {
                                Decrement (Local0)
                            }

                            Store (Local0, R74H)
                            And (IOD0, 0x8F, IOD0)
                            If (LEqual (IOHI, 0x03))
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x00, IOD0)
                                }
                                Else
                                {
                                    Or (IOD0, 0x70, IOD0)
                                }
                            }
                            Else
                            {
                                If (LEqual (IOLO, 0xF8))
                                {
                                    Or (IOD0, 0x10, IOD0)
                                }
                                Else
                                {
                                    Or (IOD0, 0x50, IOD0)
                                }
                            }

                            Store (0x01, R30H)
                            Or (RF0H, 0x80, Local0)
                            Store (Local0, RF0H)
                        }

                        Method (_PS0, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x01, R30H)
                        }

                        Method (_PS3, 0, Serialized)
                        {
                            Store (0x02, R07H)
                            Store (0x00, R30H)
                        }
                    }
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
                    Method (_STA, 0, NotSerialized)
                    {
                        If (\ECON)
                        {
                            Store (\_SB.PCI0.LPCB.EC0.KBID, Local0)
                            If (LEqual (Local0, 0x01))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            ShiftRight (RBEC (0x71), 0x04, Local0)
                            And (Local0, 0x07, Local0)
                            If (LEqual (Local0, 0x01))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }
                    }
                }

                Device (KBC1)
                {
                    Name (_HID, EisaId ("PNP0320"))
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
                    Method (_STA, 0, NotSerialized)
                    {
                        If (\ECON)
                        {
                            Store (\_SB.PCI0.LPCB.EC0.KBID, Local0)
                            If (LEqual (Local0, 0x01))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                        Else
                        {
                            ShiftRight (RBEC (0x71), 0x04, Local0)
                            And (Local0, 0x07, Local0)
                            If (LEqual (Local0, 0x01))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
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
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }
            }

            Device (PATA)
            {
                Name (_ADR, 0x001F0001)
                OperationRegion (PACS, PCI_Config, 0x40, 0xC0)
                Field (PACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                            Offset (0x04), 
                    PSIT,   4, 
                            Offset (0x08), 
                    SYNC,   4, 
                            Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                            Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (PBUF, Buffer (0x14)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (PBUF, 0x00, PIO0)
                        CreateDWordField (PBUF, 0x04, DMA0)
                        CreateDWordField (PBUF, 0x08, PIO1)
                        CreateDWordField (PBUF, 0x0C, DMA1)
                        CreateDWordField (PBUF, 0x10, FLAG)
                        Store (GETP (PRIT), PIO0)
                        Store (GDMA (And (SYNC, 0x01), And (ICR3, 0x01), 
                            And (ICR0, 0x01), SDT0, And (ICR1, 0x01)), DMA0)
                        If (LEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (PIO0, DMA0)
                        }

                        If (And (PRIT, 0x4000))
                        {
                            If (LEqual (And (PRIT, 0x90), 0x80))
                            {
                                Store (0x0384, PIO1)
                            }
                            Else
                            {
                                Store (GETT (PSIT), PIO1)
                            }
                        }
                        Else
                        {
                            Store (0xFFFFFFFF, PIO1)
                        }

                        Store (GDMA (And (SYNC, 0x02), And (ICR3, 0x02), 
                            And (ICR0, 0x02), SDT1, And (ICR1, 0x02)), DMA1)
                        If (LEqual (DMA1, 0xFFFFFFFF))
                        {
                            And (GPI0, 0x14, Local0)
                            If (LEqual (Local0, 0x10))
                            {
                                Store (0x14, DMA1)
                            }
                            Else
                            {
                                Store (0x3C, DMA1)
                            }
                        }

                        Store (GETF (And (SYNC, 0x01), And (SYNC, 0x02), 
                            PRIT), FLAG)
                        Or (FLAG, 0x1C, FLAG)
                        If (And (LEqual (PIO0, 0xFFFFFFFF), LEqual (DMA0, 0xFFFFFFFF)))
                        {
                            Store (0x78, PIO0)
                            Store (0x14, DMA0)
                            Store (0x03, FLAG)
                        }

                        Return (PBUF)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, 0x00, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        If (LEqual (SizeOf (Arg1), 0x0200))
                        {
                            And (PRIT, 0x40F0, PRIT)
                            And (SYNC, 0x02, SYNC)
                            Store (0x00, SDT0)
                            And (ICR0, 0x02, ICR0)
                            And (ICR3, 0x02, ICR3)
                            And (ICR5, 0x02, ICR5)
                            CreateWordField (Arg1, 0x62, W490)
                            CreateWordField (Arg1, 0x6A, W530)
                            CreateWordField (Arg1, 0x7E, W630)
                            CreateWordField (Arg1, 0x80, W640)
                            CreateWordField (Arg1, 0xB0, W880)
                            CreateWordField (Arg1, 0xBA, W930)
                            Or (PRIT, 0x8004, PRIT)
                            If (LAnd (And (FLAG, 0x02), And (W490, 0x0800)))
                            {
                                Or (PRIT, 0x02, PRIT)
                            }

                            Or (PRIT, SETP (PIO0, W530, W640), PRIT)
                            If (And (FLAG, 0x01))
                            {
                                Or (SYNC, 0x01, SYNC)
                                Store (SDMA (DMA0), SDT0)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, 0x01, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, 0x01, ICR0)
                                }

                                If (And (W930, 0x2000))
                                {
                                    Or (ICR1, 0x01, ICR1)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (PRIT, 0x3F0F, PRIT)
                            Store (0x00, PSIT)
                            And (SYNC, 0x01, SYNC)
                            Store (0x00, SDT1)
                            And (ICR0, 0x01, ICR0)
                            And (ICR1, 0x01, ICR1)
                            And (ICR3, 0x01, ICR3)
                            And (ICR5, 0x01, ICR5)
                            CreateWordField (Arg2, 0x62, W491)
                            CreateWordField (Arg2, 0x6A, W531)
                            CreateWordField (Arg2, 0x7E, W631)
                            CreateWordField (Arg2, 0x80, W641)
                            CreateWordField (Arg2, 0xB0, W881)
                            CreateWordField (Arg2, 0xBA, W931)
                            Or (PRIT, 0x8040, PRIT)
                            If (LAnd (And (FLAG, 0x08), And (W491, 0x0800)))
                            {
                                Or (PRIT, 0x20, PRIT)
                            }

                            If (And (FLAG, 0x10))
                            {
                                Or (PRIT, 0x4000, PRIT)
                                If (LGreater (PIO1, 0xF0))
                                {
                                    Or (PRIT, 0x80, PRIT)
                                }
                                Else
                                {
                                    Or (PRIT, 0x10, PRIT)
                                    Store (SETT (PIO1, W531, W641), PSIT)
                                }
                            }

                            If (And (FLAG, 0x04))
                            {
                                Or (SYNC, 0x02, SYNC)
                                Store (SDMA (DMA1), SDT1)
                                If (LLess (DMA1, 0x1E))
                                {
                                    Or (ICR3, 0x02, ICR3)
                                }

                                If (LLess (DMA1, 0x3C))
                                {
                                    Or (ICR0, 0x02, ICR0)
                                }

                                If (And (W931, 0x2000))
                                {
                                    Or (ICR1, 0x02, ICR1)
                                }
                            }
                        }
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (0x00)
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB0, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            })
                            CreateByteField (PIB0, 0x01, PMD0)
                            CreateByteField (PIB0, 0x08, DMD0)
                            If (And (PRIT, 0x02))
                            {
                                If (LEqual (And (PRIT, 0x09), 0x08))
                                {
                                    Store (0x08, PMD0)
                                }
                                Else
                                {
                                    Store (0x0A, PMD0)
                                    ShiftRight (And (PRIT, 0x0300), 0x08, Local0)
                                    ShiftRight (And (PRIT, 0x3000), 0x0C, Local1)
                                    Add (Local0, Local1, Local2)
                                    If (LEqual (0x03, Local2))
                                    {
                                        Store (0x0B, PMD0)
                                    }

                                    If (LEqual (0x05, Local2))
                                    {
                                        Store (0x0C, PMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD0)
                            }

                            If (And (SYNC, 0x01))
                            {
                                Store (Or (SDT0, 0x40), DMD0)
                                If (And (ICR1, 0x01))
                                {
                                    If (And (ICR0, 0x01))
                                    {
                                        Add (DMD0, 0x02, DMD0)
                                    }

                                    If (And (ICR3, 0x01))
                                    {
                                        Store (0x45, DMD0)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD0, 0x07), 0x02), 0x20, DMD0)
                            }

                            Return (PIB0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (0x01)
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            If (Arg0)
                            {
                                BEJ0 ()
                            }
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            BSTA ()
                        }

                        Method (BEJ0, 0, NotSerialized)
                        {
                            Store (0x01, \_SB.PCI0.LPCB.EC0.BYPW)
                            Sleep (0x012C)
                        }

                        Method (BSTA, 0, NotSerialized)
                        {
                            And (GPI0, 0x14, Local0)
                            If (LOr (LEqual (Local0, 0x00), LEqual (Local0, 0x10)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (BYIN, 0, NotSerialized)
                        {
                            If (LEqual (\_SB.PCI0.LPCB.EC0.BYPW, 0x01))
                            {
                                Store (0xEE, P80H)
                                Store (0x00, \_SB.PCI0.LPCB.EC0.BYPW)
                            }

                            Sleep (0x64)
                            PHSR (0x36, 0x00)
                            Sleep (0x03E8)
                            Notify (\_SB.PCI0.PATA.PRID.P_D1, 0x00)
                        }

                        Method (BYOU, 0, NotSerialized)
                        {
                            Store (0x01, \_SB.PCI0.LPCB.EC0.BYPW)
                            Notify (\_SB.PCI0.PATA.PRID.P_D1, 0x03)
                            Sleep (0x012C)
                        }

                        Method (BWAK, 0, NotSerialized)
                        {
                            If (LEqual (\_SB.PCI0.PATA.PRID.P_D1._STA (), 0x00))
                            {
                                Notify (\_SB.PCI0.PATA.PRID.P_D1, 0x03)
                            }
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            })
                            CreateByteField (PIB1, 0x01, PMD1)
                            CreateByteField (PIB1, 0x08, DMD1)
                            If (And (PRIT, 0x20))
                            {
                                If (LEqual (And (PRIT, 0x90), 0x80))
                                {
                                    Store (0x08, PMD1)
                                }
                                Else
                                {
                                    Add (And (PSIT, 0x03), ShiftRight (And (PSIT, 0x0C), 
                                        0x02), Local0)
                                    If (LEqual (0x05, Local0))
                                    {
                                        Store (0x0C, PMD1)
                                    }
                                    Else
                                    {
                                        If (LEqual (0x03, Local0))
                                        {
                                            Store (0x0B, PMD1)
                                        }
                                        Else
                                        {
                                            Store (0x0A, PMD1)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, PMD1)
                            }

                            If (And (SYNC, 0x02))
                            {
                                Store (Or (SDT1, 0x40), DMD1)
                                If (And (ICR1, 0x02))
                                {
                                    If (And (ICR0, 0x02))
                                    {
                                        Add (DMD1, 0x02, DMD1)
                                    }

                                    If (And (ICR3, 0x02))
                                    {
                                        Store (0x45, DMD1)
                                    }
                                }
                            }
                            Else
                            {
                                Or (Subtract (And (PMD1, 0x07), 0x02), 0x20, DMD1)
                            }

                            Return (PIB1)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                    }
                }
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)
                OperationRegion (SMBP, PCI_Config, 0x40, 0xC0)
                Field (SMBP, DWordAcc, NoLock, Preserve)
                {
                        ,   2, 
                    I2CE,   1
                }

                OperationRegion (SMBI, SystemIO, 0x20A0, 0x10)
                Field (SMBI, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                            Offset (0x02), 
                    HCON,   8, 
                    HCOM,   8, 
                    TXSA,   8, 
                    DAT0,   8, 
                    DAT1,   8, 
                    HBDR,   8, 
                    PECR,   8, 
                    RXSA,   8, 
                    SDAT,   16
                }

                Method (SSXB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRXB, 1, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (0x44, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (DAT0)
                    }

                    Return (0xFFFF)
                }

                Method (SWRB, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (Arg2, DAT0)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRDB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (DAT0)
                    }

                    Return (0xFFFF)
                }

                Method (SBLW, 4, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg3, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (SizeOf (Arg2), DAT0)
                    Store (0x00, Local1)
                    Store (DerefOf (Index (Arg2, 0x00)), HBDR)
                    Store (0x54, HCON)
                    While (LGreater (SizeOf (Arg2), Local1))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (0x80, HSTS)
                        Increment (Local1)
                        If (LGreater (SizeOf (Arg2), Local1))
                        {
                            Store (DerefOf (Index (Arg2, Local1)), HBDR)
                        }
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SBLR, 3, Serialized)
                {
                    Name (TBUF, Buffer (0x0100) {})
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg2, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, 0x01), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x54, HCON)
                    Store (0x0FA0, Local0)
                    While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                    {
                        Decrement (Local0)
                        Stall (0x32)
                    }

                    If (LNot (Local0))
                    {
                        KILL ()
                        Return (0x00)
                    }

                    Store (DAT0, Index (TBUF, 0x00))
                    Store (0x80, HSTS)
                    Store (0x01, Local1)
                    While (LLess (Local1, DerefOf (Index (TBUF, 0x00))))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (HBDR, Index (TBUF, Local1))
                        Store (0x80, HSTS)
                        Increment (Local1)
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (TBUF)
                    }

                    Return (0x00)
                }

                Method (STRT, 0, Serialized)
                {
                    Store (0xC8, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x40))
                        {
                            Decrement (Local0)
                            Sleep (0x01)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x01)
                            }
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }
                    }

                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x01))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Return (0x01)
                }

                Method (COMP, 0, Serialized)
                {
                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x02))
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                    }

                    Return (0x00)
                }

                Method (KILL, 0, Serialized)
                {
                    Or (HCON, 0x02, HCON)
                    Or (HSTS, 0xFF, HSTS)
                }
            }
        }
    }
}

