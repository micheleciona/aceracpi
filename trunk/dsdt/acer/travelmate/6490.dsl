/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080514
 *
 * Disassembly of 6490, Fri Jun 27 20:49:23 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000080C4 (32964)
 *     Revision         0x02
 *     Checksum         0x30
 *     OEM ID           "INTEL "
 *     OEM Table ID     "CRESTLNE"
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20050624 (537200164)
 */
DefinitionBlock ("6490.aml", "DSDT", 2, "INTEL ", "CRESTLNE", 0x06040000)
{
    External (PDC1)
    External (PDC0)
    External (CFGD)
    External (^CPU0._PPC)

    Mutex (MUTX, 0x00)
    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
    }

    Method (P8XH, 2, Serialized)
    {
        If (LEqual (Arg0, Zero))
        {
            Store (Or (And (P80D, 0xFFFFFF00), Arg1), P80D)
        }

        If (LEqual (Arg0, One))
        {
            Store (Or (And (P80D, 0xFFFF00FF), ShiftLeft (Arg1, 0x08)
                ), P80D)
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Or (And (P80D, 0xFF00FFFF), ShiftLeft (Arg1, 0x10)
                ), P80D)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Or (And (P80D, 0x00FFFFFF), ShiftLeft (Arg1, 0x18)
                ), P80D)
        }

        Store (P80D, P80H)
    }

    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Zero, P80D)
        P8XH (Zero, Arg0)
        If (LEqual (Arg0, 0x05))
        {
            Store (Zero, PRM0)
            Store (0x8A, SMIF)
            Store (Zero, TRP0)
            \_SB.PHSR (0x4B)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x13, PRM0)
            Store (0x8A, SMIF)
            Store (Zero, TRP0)
            Store (0x95, SMIF)
            Store (Zero, TRP0)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x14, PRM0)
            Store (0x8A, SMIF)
            Store (Zero, TRP0)
            Store (0x95, SMIF)
            Store (Zero, TRP0)
        }

        TRAP (0x50)
    }

    Method (_WAK, 1, NotSerialized)
    {
        P8XH (One, 0xAB)
        If (LEqual (Arg0, 0x03))
        {
            If (LAnd (DTSE, MPEN))
            {
                Store (0x46, SMIF)
                Store (Zero, TRP0)
            }
        }

        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LEqual (OSYS, 0x07D1)))
                {
                    TRAP (0x3D)
                }
            }
        }

        Notify (\_SB.PCI0.USB1, Zero)
        Notify (\_SB.PCI0.USB2, Zero)
        Notify (\_SB.PCI0.USB4, Zero)
        Notify (\_SB.PCI0.USB5, Zero)
        If (LEqual (RP1D, Zero))
        {
            Notify (\_SB.PCI0.RP01, Zero)
        }

        If (LEqual (RP2D, Zero))
        {
            Notify (\_SB.PCI0.RP02, Zero)
        }

        If (LEqual (RP3D, Zero))
        {
            Notify (\_SB.PCI0.RP03, Zero)
        }

        If (LEqual (RP4D, Zero))
        {
            Notify (\_SB.PCI0.RP04, Zero)
        }

        If (LEqual (RP5D, Zero))
        {
            Notify (\_SB.PCI0.RP05, Zero)
        }

        If (LEqual (RP6D, Zero))
        {
            Notify (\_SB.PCI0.RP06, Zero)
        }

        If (LEqual (Arg0, 0x03))
        {
            TRAP (0x8B)
            TRAP (0x46)
            Store (0x96, SMIF)
            Store (Zero, TRP0)
            If (LEqual (OSYS, 0x07D6))
            {
                Store (One, VSTA)
                Sleep (0x0A)
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            If (LEqual (OSYS, 0x07D6))
            {
                Notify (\_SB.PWRB, 0x80)
                Store (One, VSTA)
                Sleep (0x0A)
            }

            Store (0x96, SMIF)
            Store (Zero, TRP0)
            If (DTSE)
            {
                TRAP (0x47)
            }

            Notify (\_TZ.TZ01, 0x80)
        }

        \_PR.RPPC ()
        P8XH (Zero, 0xCD)
        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }

    Method (GETB, 3, Serialized)
    {
        Multiply (Arg0, 0x08, Local0)
        Multiply (Arg1, 0x08, Local1)
        CreateField (Arg2, Local0, Local1, TBF3)
        Return (TBF3)
    }

    Method (PNOT, 0, Serialized)
    {
        If (MPEN)
        {
            If (And (PDC0, 0x08))
            {
                Notify (\_PR.CPU0, 0x80)
                If (And (PDC0, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU0, 0x81)
                }
            }

            If (And (PDC1, 0x08))
            {
                Notify (\_PR.CPU1, 0x80)
                If (And (PDC1, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU1, 0x81)
                }
            }
        }
        Else
        {
            Notify (\_PR.CPU0, 0x80)
            Sleep (0x64)
            Notify (\_PR.CPU0, 0x81)
        }
    }

    Method (TRAP, 1, Serialized)
    {
        Store (Arg0, SMIF)
        Store (Zero, TRP0)
        Return (SMIF)
    }

    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized)
        {
            If (DTSE)
            {
                TRAP (0x47)
            }

            Store (0x07D0, OSYS)
            If (CondRefOf (_OSI, Local0))
            {
                Store (Zero, VSTA)
                Sleep (0x0A)
                If (_OSI ("Linux"))
                {
                    Store (One, LINX)
                }

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
                    Store (One, VSTA)
                    Sleep (0x0A)
                }
            }

            If (LAnd (MPEN, LEqual (OSYS, 0x07D1)))
            {
                TRAP (0x3D)
            }

            TRAP (0x2B)
            TRAP (0x32)
        }
    }

    OperationRegion (GNVS, SystemMemory, 0x3E6C9DBC, 0x0100)
    Field (GNVS, AnyAcc, Lock, Preserve)
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
        LINX,   8, 
                Offset (0x14), 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        FANS,   8, 
                Offset (0x28), 
        APIC,   8, 
        MPEN,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
                Offset (0x32), 
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
                Offset (0x67), 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
                Offset (0x6E), 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
                Offset (0x74), 
        MEFE,   8, 
                Offset (0x78), 
        TPMP,   8, 
        TPME,   8, 
                Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
                Offset (0xAA), 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IDMM,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32
    }

    Name (DSEN, One)
    Name (ECON, Zero)
    Name (GPIC, Zero)
    Name (CTYP, Zero)
    Name (L01C, Zero)
    Name (VFN0, Zero)
    Name (VFN1, Zero)
    Scope (_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            Add (L01C, One, L01C)
            P8XH (Zero, One)
            P8XH (One, L01C)
            If (LAnd (LEqual (RP1D, Zero), \_SB.PCI0.RP01.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP01.PDCX)
                {
                    Store (One, \_SB.PCI0.RP01.PDCX)
                    Store (One, \_SB.PCI0.RP01.HPSX)
                    Notify (\_SB.PCI0.RP01, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP01.HPSX)
                }
            }

            If (LAnd (LEqual (RP2D, Zero), \_SB.PCI0.RP02.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP02.PDCX)
                {
                    Store (One, \_SB.PCI0.RP02.PDCX)
                    Store (One, \_SB.PCI0.RP02.HPSX)
                    Notify (\_SB.PCI0.RP02, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP02.HPSX)
                }
            }

            If (LAnd (LEqual (RP3D, Zero), \_SB.PCI0.RP03.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP03.PDCX)
                {
                    Store (One, \_SB.PCI0.RP03.PDCX)
                    Store (One, \_SB.PCI0.RP03.HPSX)
                    Notify (\_SB.PCI0.RP03, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP03.HPSX)
                }
            }

            If (LAnd (LEqual (RP4D, Zero), \_SB.PCI0.RP04.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP04.PDCX)
                {
                    Store (One, \_SB.PCI0.RP04.PDCX)
                    Store (One, \_SB.PCI0.RP04.HPSX)
                    Notify (\_SB.PCI0.RP04, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP04.HPSX)
                }
            }

            If (LAnd (LEqual (RP5D, Zero), \_SB.PCI0.RP05.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP05.PDCX)
                {
                    Store (One, \_SB.PCI0.RP05.PDCX)
                    Store (One, \_SB.PCI0.RP05.HPSX)
                    Notify (\_SB.PCI0.RP05, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP05.HPSX)
                }
            }

            If (LAnd (LEqual (RP6D, Zero), \_SB.PCI0.RP06.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP06.PDCX)
                {
                    Store (One, \_SB.PCI0.RP06.PDCX)
                    Store (One, \_SB.PCI0.RP06.HPSX)
                    Notify (\_SB.PCI0.RP06, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP06.HPSX)
                }
            }
        }

        Method (_L02, 0, NotSerialized)
        {
            Store (Zero, GPEC)
            Notify (\_TZ.TZ01, 0x80)
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB5, 0x02)
        }

        Method (_L06, 0, NotSerialized)
        {
            If (\_SB.PCI0.GFX0.GSSE)
            {
                \_SB.PCI0.GFX0.GSCI ()
            }
            Else
            {
                Store (One, SCIS)
            }
        }

        Method (_L09, 0, NotSerialized)
        {
            If (\_SB.PCI0.RP01.PSPX)
            {
                Store (One, \_SB.PCI0.RP01.PSPX)
                Store (One, \_SB.PCI0.RP01.PMSX)
                Notify (\_SB.PCI0.RP01, 0x02)
            }

            If (\_SB.PCI0.RP02.PSPX)
            {
                Store (One, \_SB.PCI0.RP02.PSPX)
                Store (One, \_SB.PCI0.RP02.PMSX)
                Notify (\_SB.PCI0.RP02, 0x02)
            }

            If (\_SB.PCI0.RP03.PSPX)
            {
                Store (One, \_SB.PCI0.RP03.PSPX)
                Store (One, \_SB.PCI0.RP03.PMSX)
                Notify (\_SB.PCI0.RP03, 0x02)
            }

            If (\_SB.PCI0.RP04.PSPX)
            {
                Store (One, \_SB.PCI0.RP04.PSPX)
                Store (One, \_SB.PCI0.RP04.PMSX)
                Notify (\_SB.PCI0.RP04, 0x02)
            }

            If (\_SB.PCI0.RP05.PSPX)
            {
                Store (One, \_SB.PCI0.RP05.PSPX)
                Store (One, \_SB.PCI0.RP05.PMSX)
                Notify (\_SB.PCI0.RP05, 0x02)
            }

            If (\_SB.PCI0.RP06.PSPX)
            {
                Store (One, \_SB.PCI0.RP06.PSPX)
                Store (One, \_SB.PCI0.RP06.PMSX)
                Notify (\_SB.PCI0.RP06, 0x02)
            }
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PCIB, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            If (\_SB.PCI0.EHC1.PMES)
            {
                Store (One, \_SB.PCI0.EHC1.PMES)
                Notify (\_SB.PCI0.EHC1, 0x02)
            }

            If (\_SB.PCI0.HDEF.PMES)
            {
                Store (One, \_SB.PCI0.HDEF.PMES)
                Notify (\_SB.PCI0.HDEF, 0x02)
            }

            If (\_SB.PCI0.LANC.PMES)
            {
                Store (One, \_SB.PCI0.LANC.PMES)
                Notify (\_SB.PCI0.LANC, 0x02)
            }
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB4, 0x02)
        }

        Method (_L11, 0, NotSerialized)
        {
            Store (0x77, P80H)
            If (LEqual (GP01, One))
            {
                Sleep (0xFA)
                Store (One, BINS)
                Store (Zero, \_SB.PCI0.SATA.P1EN)
                Store (One, \_SB.PCI0.PATA.ICR4)
                Sleep (0xFA)
                Notify (\_SB.PCI0.PATA, One)
                Sleep (0xFA)
                Notify (\_SB.PCI0.SATA, One)
                Sleep (0xFA)
                Store (0xCC, P80H)
            }

            If (LAnd (LEqual (BID0, One), LEqual (BID1, One)))
            {
                Sleep (0x01F4)
                Store (Zero, BINS)
                Sleep (0x01F4)
                Store (One, \_SB.PCI0.SATA.P1EN)
                Sleep (0x01F4)
                Store (Zero, \_SB.PCI0.SATA.P1EN)
                Sleep (0x01F4)
                Store (One, \_SB.PCI0.SATA.P1EN)
                Sleep (0x01F4)
                Store (0x33, \_SB.PCI0.SATA.ICR0)
                Sleep (0x01F4)
                Store (0x30, \_SB.PCI0.SATA.ICR1)
                Sleep (0x01F4)
                Store (0xAA, P80H)
                Notify (\_SB.PCI0.SATA, One)
            }

            If (LAnd (LEqual (BID0, One), LEqual (BID1, Zero)))
            {
                Store (Zero, BINS)
                Store (Zero, \_SB.PCI0.PATA.ICR4)
                Store (0xBB, P80H)
                Sleep (0x0514)
                Notify (\_SB.PCI0.PATA, One)
            }

            Store (0x88, P80H)
        }
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x00001010, 0x06) {}
        Processor (CPU1, 0x01, 0x00001010, 0x06) {}
        Method (RPPC, 0, NotSerialized)
        {
            If (LEqual (OSYS, 0x07D2))
            {
                If (And (CFGD, One))
                {
                    If (LGreater (^CPU0._PPC, Zero))
                    {
                        Subtract (^CPU0._PPC, One, ^CPU0._PPC)
                        PNOT ()
                        Add (^CPU0._PPC, One, ^CPU0._PPC)
                        PNOT ()
                    }
                    Else
                    {
                        Add (^CPU0._PPC, One, ^CPU0._PPC)
                        PNOT ()
                        Subtract (^CPU0._PPC, One, ^CPU0._PPC)
                        PNOT ()
                    }
                }
            }
        }
    }

    Name (DFEC, Zero)
    Scope (_TZ)
    {
        PowerResource (FN00, 0x00, 0x0000)
        {
            Method (_STA, 0, Serialized)
            {
                If (LEqual (FANS, Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (One)
                }
            }

            Method (_ON, 0, Serialized)
            {
            }

            Method (_OFF, 0, Serialized)
            {
            }
        }

        Device (FAN0)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Name (_UID, Zero)
            Name (_PR0, Package (0x01)
            {
                FN00
            })
        }

        ThermalZone (TZ00)
        {
            Method (_AC0, 0, Serialized)
            {
                Return (Add (0x0AAC, Multiply (ACTT, 0x0A)))
            }

            Name (_AL0, Package (0x01)
            {
                FAN0
            })
            Method (_CRT, 0, Serialized)
            {
                If (DTSE)
                {
                    Return (Add (0x0AAC, Multiply (CRTT, 0x0A)))
                }

                Return (0x0ED0)
            }

            Method (_SCP, 1, Serialized)
            {
                Store (Arg0, CTYP)
            }

            Method (_TMP, 0, Serialized)
            {
                Store (CRTP, Local0)
                If (And (Local0, 0x80))
                {
                    Subtract (Local0, 0x0100, Local0)
                }

                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }

            Method (_PSL, 0, Serialized)
            {
                If (MPEN)
                {
                    Return (Package (0x02)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1
                    })
                }

                Return (Package (0x01)
                {
                    \_PR.CPU0
                })
            }

            Method (_PSV, 0, Serialized)
            {
                Return (Add (0x0AAC, Multiply (PSVT, 0x0A)))
            }

            Method (_TSP, 0, Serialized)
            {
                Return (0x96)
            }
        }

        ThermalZone (TZVR)
        {
            Method (_TMP, 0, Serialized)
            {
                Store (VRTP, Local0)
                If (And (Local0, 0x80))
                {
                    Subtract (Local0, 0x0100, Local0)
                }

                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }

            Method (_CRT, 0, NotSerialized)
            {
                Return (0x0ED0)
            }
        }

        ThermalZone (TZVL)
        {
            Method (_TMP, 0, Serialized)
            {
                Store (VLTP, Local0)
                If (And (Local0, 0x80))
                {
                    Subtract (Local0, 0x0100, Local0)
                }

                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }

            Method (_CRT, 0, NotSerialized)
            {
                Return (0x0ED0)
            }
        }

        ThermalZone (TZ01)
        {
            Method (_CRT, 0, Serialized)
            {
                Return (0x0ED0)
            }

            Method (_TMP, 0, Serialized)
            {
                Store (CLTP, Local0)
                If (And (Local0, 0x80))
                {
                    Subtract (Local0, 0x0100, Local0)
                }

                Return (Add (0x0AAC, Multiply (Local0, 0x0A)))
            }
        }
    }

    Scope (_SB)
    {
        OperationRegion (SMI2, SystemMemory, 0x3E6C9EBD, 0x00000090)
        Field (SMI2, AnyAcc, NoLock, Preserve)
        {
            WCMD,   8, 
            WDID,   32, 
            TPID,   8, 
            DI00,   320
        }

        Field (SMI2, AnyAcc, NoLock, Preserve)
        {
                    Offset (0x06), 
            D000,   32, 
            D001,   32, 
            D002,   32, 
            D003,   32, 
            D004,   32
        }

        Method (PHWM, 2, NotSerialized)
        {
            Store (0xE0, WCMD)
            Store (0x57, TPID)
            Store (Arg0, WDID)
            Store (Arg1, DI00)
            Store (Zero, SMIC)
            Store (DI00, Local0)
            Return (Local0)
        }

        Device (WMID)
        {
            Name (_HID, "PNP0C14")
            Name (_UID, Zero)
            Name (ERRD, 0x00010000)
            Name (BUFF, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateByteField (BUFF, Zero, BF00)
            CreateByteField (BUFF, One, BF01)
            CreateByteField (BUFF, 0x02, BF02)
            CreateByteField (BUFF, 0x03, BF03)
            Name (BUF1, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            Name (AADS, Buffer (0x04)
            {
                0x00
            })
            CreateField (AADS, Zero, 0x04, AS00)
            CreateField (AADS, 0x04, One, AS01)
            CreateField (AADS, 0x05, One, AS02)
            CreateField (AADS, 0x10, 0x10, AS03)
            Name (BAEF, Zero)
            Name (BADF, Zero)
            Name (BADG, Package (0x03)
            {
                One, 
                One, 
                Zero
            })
            Name (BADS, Package (0x04)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Name (WLDS, Zero)
            Name (WLED, Zero)
            Name (BTDS, Zero)
            Name (BTED, Zero)
            Name (BLDS, Zero)
            Name (BLED, Zero)
            Name (NTDC, Zero)
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
            Name (BAIO, 0x0500)
            Name (VAIO, 0x0501)
            Name (G3SD, 0x0600)
            Name (G3SE, 0x0601)
            Name (LANI, 0x0700)
            Name (LANO, 0x0701)
            Name (BNSL, Package (0x10)
            {
                0x0300, 
                0x0301, 
                0x0302, 
                0x0303, 
                0x0304, 
                0x0305, 
                0x0306, 
                0x0307, 
                0x0308, 
                0x0309, 
                0x030A, 
                0x030B, 
                0x030C, 
                0x030D, 
                0x030E, 
                0x030F
            })
            Name (BBSB, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (BBSB, Zero, 0x10, BBD0)
            CreateField (BBSB, 0x10, 0x10, BBD1)
            Name (TLS0, Zero)
            Name (TLS1, One)
            Name (TLS2, 0x02)
            Name (TLS3, 0x03)
            Name (TLS4, 0x04)
            Name (TLS5, 0x05)
            Name (TLS6, 0x06)
            Name (TLS7, 0x07)
            Name (TLSL, Package (0x07)
            {
                0x07, 
                0x06, 
                0x05, 
                0x04, 
                0x03, 
                0x02, 
                One
            })
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
            CreateField (BDDS, Zero, 0x10, BDD0)
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
            CreateField (DSY0, Zero, 0x40, DY00)
            CreateField (DSY0, 0x40, 0x40, DY01)
            CreateField (DSY0, 0x80, 0x40, DY02)
            CreateField (DSY0, 0xC0, 0x40, DY03)
            CreateField (DSY0, 0x0100, 0x40, DY04)
            CreateField (DSY1, Zero, 0x40, DY10)
            CreateField (DSY1, 0x40, 0x40, DY11)
            CreateField (DSY1, 0x80, 0x40, DY12)
            CreateField (DSY2, Zero, 0x40, DY20)
            CreateField (DSY2, 0x40, 0x10, DY21)
            CreateField (DSY2, 0x50, 0x10, DY22)
            CreateField (DSY0, Zero, 0xC0, DSX4)
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
            Name (WIT0, Zero)
            Name (DSY6, Buffer (0x28)
            {
                /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            CreateField (DSY6, Zero, 0x20, DY60)
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
            CreateField (WPRW, Zero, 0x08, WWD0)
            CreateField (WPRW, 0x08, 0x08, WWD1)
            CreateField (WPRW, 0x10, 0x08, WWD2)
            CreateField (WPRW, 0x18, 0x08, WWD3)
            CreateField (WPRW, 0x20, 0x08, WWD4)
            CreateField (WPRW, 0x28, 0x20, WWD5)
            Name (WPCI, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })
            CreateField (WPCI, Zero, 0x08, WPIR)
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
            Name (GSTS, Zero)
            Name (BFEF, Zero)
            Name (BGEF, Zero)
            Name (BGDS, Package (0x01)
            {
                One
            })
            Method (AAF1, 0, NotSerialized)
            {
                If (^^PCI0.LPCB.EC0.ECOK)
                {
                    If (WEXT)
                    {
                        Store (0x07, AS00)
                    }
                    Else
                    {
                        Store (Zero, AS00)
                    }

                    Store (BEXT, AS01)
                    Store (Zero, AS02)
                    Store (Zero, AS03)
                }
                Else
                {
                    Store (Zero, AS00)
                    Store (Zero, AS01)
                    Store (Zero, AS02)
                    Store (Zero, AS03)
                }

                Store (Zero, AS02)
            }

            Method (Z000, 1, NotSerialized)
            {
                If (^^PCI0.LPCB.EC0.ECOK)
                {
                    If (LEqual (Arg0, One))
                    {
                        Store (WSTS, Local0)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02))
                        {
                            Store (BSTS, Local0)
                        }
                        Else
                        {
                            Store (BRIG, Local0)
                        }
                    }
                }
                Else
                {
                    Store (Zero, Local0)
                }

                Store (Local0, Index (BADG, Subtract (Arg0, One)))
            }

            Method (Z001, 2, NotSerialized)
            {
                If (^^PCI0.LPCB.EC0.ECOK)
                {
                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Arg1, BUFF)
                        If (BF00)
                        {
                            ECW1 (0x05, 0x16)
                        }
                        Else
                        {
                            ECW1 (0x06, 0x16)
                        }
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Arg1, BUFF)
                        If (BF00)
                        {
                            ECW1 (0x07, 0x16)
                        }
                        Else
                        {
                            ECW1 (0x08, 0x16)
                        }
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        If (LNot (VSTA))
                        {
                            Store (Arg1, BUFF)
                            ECW1 (BF00, 0x4D)
                        }
                    }
                }
            }

            Method (Z002, 1, NotSerialized)
            {
                If (LEqual (Arg0, 0x80))
                {
                    If (WPRS)
                    {
                        If (WSTS)
                        {
                            Store (Zero, WPRS)
                            Return (WLSE)
                        }
                        Else
                        {
                            Store (Zero, WPRS)
                            Return (WLSD)
                        }
                    }
                    Else
                    {
                        If (BTRS)
                        {
                            If (BSTS)
                            {
                                Store (Zero, BTRS)
                                Return (BLTE)
                            }
                            Else
                            {
                                Store (Zero, BTRS)
                                Return (BLTD)
                            }
                        }
                        Else
                        {
                            If (G3RS)
                            {
                                If (G3TS)
                                {
                                    Store (Zero, G3RS)
                                    Return (G3SE)
                                }
                                Else
                                {
                                    Store (Zero, G3RS)
                                    Return (G3SD)
                                }
                            }
                            Else
                            {
                                If (LNot (VSTA))
                                {
                                    Store (Zero, BPRS)
                                    Store (BRIG, Local0)
                                    Return (DerefOf (Index (BNSL, Local0)))
                                }
                            }
                        }
                    }
                }
                Else
                {
                    If (LEqual (Arg0, 0x82))
                    {
                        If (CRTS)
                        {
                            Store (One, VAIO)
                        }
                        Else
                        {
                            Store (Zero, VAIO)
                        }
                    }
                    Else
                    {
                        Return (One)
                    }
                }
            }

            Method (Z003, 1, NotSerialized)
            {
                If (Arg0)
                {
                    Store (DerefOf (Index (TLSL, Subtract (Arg0, One))), THDY)
                    Store (One, THEN)
                }
                Else
                {
                    Store (Arg0, THEN)
                }
            }

            Method (Z004, 2, NotSerialized)
            {
            }

            Method (Z005, 1, NotSerialized)
            {
            }

            Method (Z006, 1, NotSerialized)
            {
            }

            Method (Z007, 1, NotSerialized)
            {
            }

            Method (Z008, 2, NotSerialized)
            {
                Store (Arg0, ^^PCI0.LPCB.C4C3)
            }

            Method (Z009, 0, NotSerialized)
            {
            }

            Method (Z00A, 0, NotSerialized)
            {
            }

            Method (Z00B, 1, NotSerialized)
            {
            }

            Method (Z00C, 1, NotSerialized)
            {
            }

            Method (Z00D, 0, NotSerialized)
            {
            }

            Method (Z00E, 2, NotSerialized)
            {
            }

            Method (Z00F, 0, NotSerialized)
            {
                Store (Zero, GSTS)
                Return (GSTS)
            }

            Method (Z00G, 1, NotSerialized)
            {
            }

            Method (Z00H, 1, NotSerialized)
            {
            }

            Method (Z00I, 1, NotSerialized)
            {
            }

            Method (Z00J, 1, NotSerialized)
            {
            }

            Method (Z00K, 1, NotSerialized)
            {
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
                Store (0x10, P80H)
                AAF1 ()
                Store (AADS, BUFF)
                Return (BUFF)
            }

            Method (WMBA, 3, NotSerialized)
            {
                Store (0x11, P80H)
                If (LLess (Arg1, 0x04))
                {
                    Store (Arg1, Local0)
                    Z000 (Local0)
                    Store (DerefOf (Index (BADG, Subtract (Arg1, One))), BUFF)
                    Return (BUFF)
                }
                Else
                {
                    If (LEqual (Arg1, 0x07))
                    {
                        Store (Arg2, BUFF)
                        Store (BF00, BAEF)
                    }
                    Else
                    {
                        Z001 (Arg1, Arg2)
                    }

                    Store (DerefOf (Index (BADS, Subtract (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }
            }

            Method (_WED, 1, NotSerialized)
            {
                Store (0x12, P80H)
                Z002 (Arg0)
            }

            Method (WMBB, 3, NotSerialized)
            {
                If (LEqual (Arg1, One))
                {
                    If (THEN)
                    {
                        Store (DerefOf (Index (TLSL, Subtract (THDY, One))), BBD0)
                        Store (Zero, BBD1)
                        Store (BBSB, BUFF)
                    }
                    Else
                    {
                        Store (Zero, BBD0)
                        Store (Zero, BBD1)
                        Store (Zero, BUFF)
                    }
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, BUFF)
                    Store (BF00, Local0)
                    Z003 (Local0)
                    Store (Zero, BUFF)
                }

                Return (BUFF)
            }

            Method (WMBC, 3, NotSerialized)
            {
                Store (0x14, P80H)
                Z004 (Arg1, Arg2)
                If (LLessEqual (Arg1, 0x05))
                {
                    Store (0x00010000, BUFF)
                }
                Else
                {
                    Store (0x00010000, BUFF)
                }

                Return (BUFF)
            }

            Method (WMBD, 3, NotSerialized)
            {
                Store (0x15, P80H)
                If (LEqual (Arg1, One))
                {
                    Store (Arg2, BUFF)
                    Store (BUFF, Local0)
                    Store (Arg2, WIT0)
                    Z005 (WIT0)
                    Return (DSY0)
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, Local0)
                    Z006 (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x03))
                {
                    Store (Arg2, Local0)
                    Z007 (Arg2)
                    Return (DSY1)
                }

                If (LEqual (Arg1, 0x04))
                {
                    Store (Arg2, BUFF)
                    Store (BF00, Local0)
                    Z008 (Local0, Zero)
                    Store (Zero, BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x05))
                {
                    Store (0xA3, P80H)
                    Store (^^PCI0.LPCB.C4C3, BF00)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x06))
                {
                    Z009 ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x07))
                {
                    Z00A ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x04))), BUFF)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x08))
                {
                    Store (Arg2, WPRW)
                    Store (WWD1, WPIR)
                    Store (WWD2, WPIF)
                    Store (WWD3, WPID)
                    Store (WWD4, WPIB)
                    Concatenate (WPCI, WWD0, Local0)
                    Z00B (Local0)
                    Return (DSY2)
                }

                If (LEqual (Arg1, 0x09))
                {
                    Store (Arg2, DSY6)
                    Store (DY60, Local0)
                    Store (Arg2, DSY0)
                    Store (DY01, WPRW)
                    Store (WWD1, WPIR)
                    Store (WWD2, WPIF)
                    Store (WWD3, WPID)
                    Store (WWD4, WPIB)
                    Store (WPCI, Local1)
                    Concatenate (DY60, WPCI, Local0)
                    Concatenate (Local0, WWD0, Local1)
                    Z00C (Local1)
                    Return (BUFF)
                }

                If (LEqual (Arg1, 0x0A))
                {
                    Z00D ()
                    Store (DerefOf (Index (BCDS, Add (Arg1, 0x02))), BUFF)
                    Return (BUFF)
                }

                Return (One)
            }

            Method (WMBE, 3, NotSerialized)
            {
                Store (0x16, P80H)
                Z00E (Arg1, Arg2)
                Store (BUFF, Debug)
                Store (BEDS, Debug)
                Store (DerefOf (Index (BEDS, Subtract (Arg1, One))), BUFF)
                Store (BUFF, Debug)
                Return (BUFF)
            }

            Method (WMBG, 3, NotSerialized)
            {
                Store (0x18, P80H)
                Store (Arg2, BUFF)
                Store (Zero, BUFF)
                Return (BUFF)
            }
        }

        Device (PCI0)
        {
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
            Device (MCHC)
            {
                Name (_ADR, Zero)
                OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
                Field (HBUS, DWordAcc, NoLock, Preserve)
                {
                    EPEN,   1, 
                        ,   11, 
                    EPBR,   20, 
                            Offset (0x08), 
                    MHEN,   1, 
                        ,   13, 
                    MHBR,   18, 
                            Offset (0x20), 
                    PXEN,   1, 
                    PXSZ,   2, 
                        ,   23, 
                    PXBR,   6, 
                            Offset (0x28), 
                    DIEN,   1, 
                        ,   11, 
                    DIBR,   20, 
                            Offset (0x30), 
                    IPEN,   1, 
                        ,   11, 
                    IPBR,   20, 
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
                            Offset (0x62), 
                    TUUD,   16, 
                            Offset (0x70), 
                        ,   4, 
                    TLUD,   12
                }
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
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
                    ,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xDFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xF0000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0EC00000,         // Length
                    ,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED40000,         // Range Minimum
                    0xFED44FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (^MCHC.PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y00._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (^MCHC.PM1L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y00._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (^MCHC.PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (^MCHC.PM1H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (^MCHC.PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (^MCHC.PM2L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (^MCHC.PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (^MCHC.PM2H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (^MCHC.PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (^MCHC.PM3L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (^MCHC.PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (^MCHC.PM3H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (^MCHC.PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (^MCHC.PM4L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (^MCHC.PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (^MCHC.PM4H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (^MCHC.PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (^MCHC.PM5L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (^MCHC.PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (^MCHC.PM5H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (^MCHC.PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (^MCHC.PM6L, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (^MCHC.PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (^MCHC.PM6H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (^MCHC.PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (^MCHC.PM0H, One))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, F0RW)
                    Store (Zero, F0RW)
                }

                If (TPRS)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, TPML)
                    Store (0x5000, TPML)
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MIN, M1MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MAX, M1MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._LEN, M1LN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0F._MIN, M2MN)
                CreateDWordField (BUF0, \_SB.PCI0._Y0F._MAX, M2MX)
                CreateDWordField (BUF0, \_SB.PCI0._Y0F._LEN, M2LN)
                ShiftLeft (^MCHC.PXBR, 0x1A, M1MX)
                ShiftRight (0x10000000, ^MCHC.PXSZ, Local0)
                Add (M1MX, Local0, M2MN)
                Add (Subtract (M2MX, M2MN), One, M2LN)
                Subtract (M1MX, One, M1MX)
                ShiftLeft (^MCHC.TLUD, 0x14, M1MN)
                Add (Subtract (M1MX, M1MN), One, M1LN)
                Return (BUF0)
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x17)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            Zero, 
                            0x10
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
                            0x0003FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            One, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            Zero, 
                            Zero, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            Zero, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            One, 
                            Zero, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            Zero, 
                            Zero, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            Zero, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            Zero, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            Zero, 
                            Zero, 
                            0x17
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            Zero, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            Zero, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            Zero, 
                            0x10
                        }
                    })
                }
                Else
                {
                    Return (Package (0x17)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            Zero, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            Zero, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            Zero, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            One, 
                            ^LPCB.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            ^LPCB.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            ^LPCB.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            Zero, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            Zero, 
                            ^LPCB.LNKE, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            Zero, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            One, 
                            ^LPCB.LNKF, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x02, 
                            ^LPCB.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            Zero, 
                            ^LPCB.LNKG, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            Zero, 
                            ^LPCB.LNKB, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            One, 
                            ^LPCB.LNKA, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            ^LPCB.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            ^LPCB.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            Zero, 
                            ^LPCB.LNKH, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            One, 
                            ^LPCB.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x02, 
                            ^LPCB.LNKC, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            Zero, 
                            ^LPCB.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            One, 
                            ^LPCB.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            ^LPCB.LNKD, 
                            Zero
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            ^LPCB.LNKA, 
                            Zero
                        }
                    })
                }
            }

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, One)
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00004000,         // Address Length
                        _Y10)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00004000,         // Address Length
                        _Y11)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y12)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y13)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y14)
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED40000,         // Address Base
                        0x00005000,         // Address Length
                        _Y15)
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x0004B000,         // Address Length
                        )
                })
                Method (_CRS, 0, Serialized)
                {
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y10._BAS, RBR0)
                    ShiftLeft (^^LPCB.RCBA, 0x0E, RBR0)
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y11._BAS, MBR0)
                    ShiftLeft (^^MCHC.MHBR, 0x0E, MBR0)
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y12._BAS, DBR0)
                    ShiftLeft (^^MCHC.DIBR, 0x0C, DBR0)
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y13._BAS, EBR0)
                    ShiftLeft (^^MCHC.EPBR, 0x0C, EBR0)
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y14._BAS, XBR0)
                    ShiftLeft (^^MCHC.PXBR, 0x1A, XBR0)
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y14._LEN, XSZ0)
                    ShiftRight (0x10000000, ^^MCHC.PXSZ, XSZ0)
                    If (TPRS)
                    {
                        CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y15._LEN, TPML)
                        Store (Zero, TPML)
                    }

                    Return (BUF0)
                }
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Device (EVGA)
                {
                    Name (_ADR, Zero)
                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x0100, 
                            0x0110, 
                            0x0200
                        })
                    }

                    Device (CRT)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }
                    }

                    Device (LCD)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_BCL, 0, NotSerialized)
                        {
                            Return (Package (0x0A)
                            {
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
                            Name (BBCM, Package (0x0A)
                            {
                                Zero, 
                                One, 
                                0x02, 
                                0x03, 
                                0x04, 
                                0x05, 
                                0x06, 
                                0x07, 
                                0x08, 
                                0x09
                            })
                            Divide (Arg0, 0x0A, Local0, Local2)
                            Store (Subtract (Local2, One), Local3)
                            Store (DerefOf (Index (BBCM, Local3)), Local4)
                            While (COMD) {}
                            Store (Local4, DAT0)
                            Sleep (0x0A)
                            Store (0x4D, COMD)
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            If (BPRS)
                            {
                                Store (Zero, BPRS)
                                Sleep (0x0A)
                                Name (BBQC, Package (0x0A)
                                {
                                    Zero, 
                                    One, 
                                    0x02, 
                                    0x03, 
                                    0x04, 
                                    0x05, 
                                    0x06, 
                                    0x07, 
                                    0x08, 
                                    0x09
                                })
                                Store (BRIG, Local0)
                                Sleep (0x0A)
                                Store (DerefOf (Index (BBQC, Local0)), Local1)
                                Store (Add (Local1, One), Local2)
                                Store (Multiply (Local2, 0x0A), Local3)
                                Return (Local3)
                            }
                        }
                    }

                    Device (TV)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }
                    }
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
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
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
                                Zero, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKD, 
                                Zero
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
                    Store (And (Arg0, 0x07), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    Return (Package (0x03)
                    {
                        0x00010100, 
                        0x00010400, 
                        0x00010200
                    })
                }

                Device (CRT1)
                {
                    Name (_ADR, 0x0100)
                    Method (_DCS, 0, NotSerialized)
                    {
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
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DTV1)
                {
                    Name (_ADR, 0x0200)
                    Method (_DCS, 0, NotSerialized)
                    {
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
                            Return (One)
                        }

                        Return (Zero)
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
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (0x0400)
                    }

                    Method (_BCL, 0, NotSerialized)
                    {
                        Return (Package (0x0A)
                        {
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
                        Name (BBCM, Package (0x0A)
                        {
                            Zero, 
                            One, 
                            0x02, 
                            0x03, 
                            0x04, 
                            0x05, 
                            0x06, 
                            0x07, 
                            0x08, 
                            0x09
                        })
                        Divide (Arg0, 0x0A, Local0, Local2)
                        Store (Subtract (Local2, One), Local3)
                        Store (DerefOf (Index (BBCM, Local3)), Local4)
                        While (COMD) {}
                        Store (Local4, DAT0)
                        Sleep (0x0A)
                        Store (0x4D, COMD)
                    }

                    Method (_BQC, 0, NotSerialized)
                    {
                        If (BPRS)
                        {
                            Store (Zero, BPRS)
                            Sleep (0x0A)
                            Name (BBQC, Package (0x0A)
                            {
                                Zero, 
                                One, 
                                0x02, 
                                0x03, 
                                0x04, 
                                0x05, 
                                0x06, 
                                0x07, 
                                0x08, 
                                0x09
                            })
                            Store (BRIG, Local0)
                            Sleep (0x0A)
                            Store (DerefOf (Index (BBQC, Local0)), Local1)
                            Store (Add (Local1, One), Local2)
                            Store (Multiply (Local2, 0x0A), Local3)
                            Return (Local3)
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
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
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID1, Zero))
                        {
                            Return (One)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID1))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (CDDS (DID1))
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID1))
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
                        If (LEqual (DID2, Zero))
                        {
                            Return (0x02)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID2))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (CDDS (DID2))
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID2))
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
                        If (LEqual (DID3, Zero))
                        {
                            Return (0x03)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID3))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID3, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID3))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID3))
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
                        If (LEqual (DID4, Zero))
                        {
                            Return (0x04)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID4))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID4, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID4))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID4))
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
                        If (LEqual (DID5, Zero))
                        {
                            Return (0x05)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID5))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID5, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID5))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Return (NDDS (DID5))
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Method (SDDL, 1, NotSerialized)
                {
                    Increment (NDID)
                    Store (And (Arg0, 0x0F0F), Local0)
                    Or (0x80000000, Local0, Local1)
                    If (LEqual (DIDL, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL2, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL3, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL4, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL5, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL6, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL7, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL8, Local0))
                    {
                        Return (Local1)
                    }

                    Return (Zero)
                }

                Method (CDDS, 1, NotSerialized)
                {
                    If (LEqual (CADL, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL2, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL3, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL4, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL5, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL6, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL7, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL8, And (Arg0, 0x0F0F)))
                    {
                        Return (0x1F)
                    }

                    Return (0x1D)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    If (LEqual (NADL, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL2, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL3, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL4, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL5, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL6, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL7, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL8, And (Arg0, 0x0F0F)))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Scope (^^PCI0)
                {
                    OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)
                    Field (MCHP, AnyAcc, NoLock, Preserve)
                    {
                                Offset (0x60), 
                        TASM,   10, 
                                Offset (0x62)
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                            Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                            Offset (0x18), 
                            Offset (0xA4), 
                    ASLE,   8, 
                            Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                            Offset (0xB0), 
                            Offset (0xB1), 
                    CDVL,   5, 
                            Offset (0xB2), 
                            Offset (0xB5), 
                    LBPC,   8, 
                            Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                            Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                            Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                            Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                            Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                            Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                            Offset (0x400), 
                    GVD1,   57344
                }

                Name (DBTB, Package (0x15)
                {
                    Zero, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x03)
                {
                    Package (0x03)
                    {
                        0xC8, 
                        0x0140, 
                        0x0190
                    }, 

                    Package (0x03)
                    {
                        0xC8, 
                        0x014D, 
                        0x0190
                    }, 

                    Package (0x03)
                    {
                        0xDE, 
                        0x014D, 
                        0x017D
                    }
                })
                Name (SUCC, One)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If (LEqual (GESF, Zero))
                        {
                            Store (0x0279, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, One))
                        {
                            Store (0x0240, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            And (PARM, 0xEFFF0000, PARM)
                            And (PARM, ShiftLeft (DerefOf (Index (DBTB, IBTT)), 0x10), 
                                PARM)
                            Or (IBTT, PARM, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (IPSC, PARM)
                            Or (PARM, ShiftLeft (IPAT, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Or (PARM, ShiftLeft (LIDS, 0x10), PARM)
                            Add (PARM, 0x00010000, PARM)
                            Or (PARM, ShiftLeft (IBIA, 0x14), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (ITVF, PARM)
                            Or (PARM, ShiftLeft (ITVM, 0x04), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (GIVD, PARM)
                            XOr (PARM, One, PARM)
                            Or (PARM, ShiftLeft (GMFN, One), PARM)
                            Or (PARM, 0x1000, PARM)
                            Store (0x03, IDMS)
                            If (IDMM)
                            {
                                Or (PARM, ShiftLeft (IDMS, 0x11), PARM)
                            }
                            Else
                            {
                                Or (PARM, ShiftLeft (IDMS, 0x0D), PARM)
                            }

                            Or (ShiftLeft (DerefOf (Index (DerefOf (Index (CDCT, HVCO)), Subtract (
                                CDVL, One))), 0x15), PARM, PARM)
                            Store (One, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            Store (Zero, PARM)
                            If (ISSC)
                            {
                                Or (PARM, 0x03, PARM)
                            }

                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (CRIT)
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If (LEqual (GESF, Zero))
                        {
                            Store (Zero, PARM)
                            Store (0xF7FD, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, One))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x03))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (And (PARM, 0x0F), ITVF)
                            Store (ShiftRight (And (PARM, 0xF0), 0x04), ITVM)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x08))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x09))
                        {
                            And (PARM, 0xFF, IBTT)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            And (PARM, 0xFF, IPSC)
                            If (And (ShiftRight (PARM, 0x08), 0xFF))
                            {
                                And (ShiftRight (PARM, 0x08), 0xFF, IPAT)
                                Decrement (IPAT)
                            }

                            And (ShiftRight (PARM, 0x14), 0x07, IBIA)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            And (ShiftRight (PARM, One), One, IF1E)
                            If (And (PARM, 0x0001E000))
                            {
                                And (ShiftRight (PARM, 0x0D), 0x0F, IDMS)
                                Store (Zero, IDMM)
                            }
                            Else
                            {
                                And (ShiftRight (PARM, 0x11), 0x0F, IDMS)
                                Store (One, IDMM)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x10))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x11))
                        {
                            Store (ShiftLeft (LIDS, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x12))
                        {
                            If (And (PARM, One))
                            {
                                If (LEqual (ShiftRight (PARM, One), One))
                                {
                                    Store (One, ISSC)
                                }
                                Else
                                {
                                    Store (Zero, GESF)
                                    Return (CRIT)
                                }
                            }
                            Else
                            {
                                Store (Zero, ISSC)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x13))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (SUCC)
                    }

                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC)
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC)
                    }

                    Store (Zero, GEFC)
                    Store (One, SCIS)
                    Store (Zero, GSSE)
                    Store (Zero, SCIE)
                    Return (Zero)
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (LNot (DRDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (DRDY))
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If (LGreater (CSTS, 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return (LEqual (CSTS, 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (One)
                    }

                    If (PSTS ())
                    {
                        Return (One)
                    }

                    Store (Arg0, CEVT)
                    Store (0x03, CSTS)
                    If (LAnd (LEqual (CHPD, Zero), LEqual (Arg1, Zero)))
                    {
                        If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                        {
                            Notify (PCI0, Arg1)
                        }
                        Else
                        {
                            Notify (GFX0, Arg1)
                        }
                    }

                    Notify (GFX0, 0x80)
                    If (LNot (PSTS ()))
                    {
                        Store (Zero, CEVT)
                    }

                    Return (Zero)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    Store (Arg0, TIDX)
                    Return (GNOT (One, Zero))
                }

                Method (GLID, 1, NotSerialized)
                {
                    Store (0x88, P80H)
                    Store (Arg0, CLID)
                    Return (GNOT (0x02, Zero))
                }

                Method (GDCK, 1, NotSerialized)
                {
                    Store (Arg0, CDCK)
                    Return (GNOT (0x04, 0x80))
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (LNot (ARDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (ARDY))
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (LNot (And (TCHE, ShiftLeft (One, Arg0))))
                    {
                        Return (One)
                    }

                    If (PARD ())
                    {
                        Return (One)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        XOr (PFIT, 0x07, PFIT)
                        Or (PFIT, 0x80000000, PFIT)
                        Store (0x04, ASLC)
                    }
                    Else
                    {
                        If (LEqual (Arg0, One))
                        {
                            Store (Divide (Multiply (Arg1, 0xFF), 0x64, ), BCLP)
                            Or (BCLP, 0x80000000, BCLP)
                            Store (0x02, ASLC)
                        }
                        Else
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, ALSI)
                                Store (One, ASLC)
                            }
                            Else
                            {
                                Return (One)
                            }
                        }
                    }

                    Store (Zero, LBPC)
                    Return (Zero)
                }
            }

            Scope (\)
            {
                Method (BRTW, 1, Serialized)
                {
                    Store (Arg0, Local1)
                    If (LEqual (ALSE, 0x02))
                    {
                        Store (Divide (Multiply (ALAF, Arg0), 0x64, ), Local1)
                        If (LGreater (Local1, 0x64))
                        {
                            Store (0x64, Local1)
                        }
                    }

                    Store (Divide (Multiply (0xFF, Local1), 0x64, ), Local0)
                    Store (Local0, PRM0)
                    Store (Arg0, BRTL)
                    If (LEqual (TRAP (0x12), Zero))
                    {
                        P8XH (0x02, Local0)
                    }
                }

                Method (HKDS, 1, Serialized)
                {
                    If (LEqual (Zero, And (0x03, DSEN)))
                    {
                        If (LEqual (TRAP (Arg0), Zero))
                        {
                            If (LNotEqual (CADL, PADL))
                            {
                                Store (CADL, PADL)
                                If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                                {
                                    Notify (\_SB.PCI0, Zero)
                                }
                                Else
                                {
                                    Notify (\_SB.PCI0.GFX0, Zero)
                                }

                                Sleep (0x02EE)
                            }

                            Notify (\_SB.PCI0.GFX0, 0x80)
                        }
                    }

                    If (LEqual (One, And (0x03, DSEN)))
                    {
                        If (LEqual (TRAP (Increment (Arg0)), Zero))
                        {
                            Notify (\_SB.PCI0.GFX0, 0x81)
                        }
                    }
                }

                Method (LSDS, 1, Serialized)
                {
                    If (Arg0)
                    {
                        HKDS (0x0C)
                    }
                    Else
                    {
                        HKDS (0x0E)
                    }

                    If (LNotEqual (And (0x03, DSEN), One))
                    {
                        Sleep (0x32)
                        While (LEqual (And (0x03, DSEN), 0x02))
                        {
                            Sleep (0x32)
                        }
                    }
                }

                Method (BRTN, 1, Serialized)
                {
                    If (LEqual (And (DID1, 0x0F00), 0x0400))
                    {
                        Notify (\_SB.PCI0.GFX0.DD01, Arg0)
                    }

                    If (LEqual (And (DID2, 0x0F00), 0x0400))
                    {
                        Notify (\_SB.PCI0.GFX0.DD02, Arg0)
                    }

                    If (LEqual (And (DID3, 0x0F00), 0x0400))
                    {
                        Notify (\_SB.PCI0.GFX0.DD03, Arg0)
                    }

                    If (LEqual (And (DID4, 0x0F00), 0x0400))
                    {
                        Notify (\_SB.PCI0.GFX0.DD04, Arg0)
                    }

                    If (LEqual (And (DID5, 0x0F00), 0x0400))
                    {
                        Notify (\_SB.PCI0.GFX0.DD05, Arg0)
                    }
                }
            }

            Scope (\)
            {
                OperationRegion (IO_T, SystemIO, 0x0800, 0x10)
                Field (IO_T, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x08), 
                    TRP0,   8
                }

                OperationRegion (PMIO, SystemIO, 0x1000, 0x80)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                        ,   1, 
                    THDY,   3, 
                    THEN,   1, 
                            Offset (0x42), 
                        ,   1, 
                    GPEC,   1, 
                            Offset (0x64), 
                        ,   9, 
                    SCIS,   1, 
                            Offset (0x66)
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
                    GL00,   1, 
                    GP01,   1, 
                        ,   7, 
                    WOLE,   1, 
                            Offset (0x0E), 
                        ,   2, 
                    BID0,   1, 
                        ,   1, 
                    BID1,   1, 
                            Offset (0x0F), 
                        ,   3, 
                    GP27,   1, 
                    GP28,   1, 
                            Offset (0x10), 
                            Offset (0x18), 
                    GB00,   8, 
                    GB01,   8, 
                    GB02,   8, 
                    GB03,   8, 
                            Offset (0x2C), 
                        ,   1, 
                    BINS,   1, 
                    GIV0,   6, 
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
                        ,   5, 
                    GP37,   1, 
                        ,   1, 
                    GP39,   1, 
                    GL05,   8, 
                    GL06,   8, 
                    GL07,   8
                }

                OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
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
                    HDAD,   1, 
                            Offset (0x341A), 
                    RP1D,   1, 
                    RP2D,   1, 
                    RP3D,   1, 
                    RP4D,   1, 
                    RP5D,   1, 
                    RP6D,   1
                }

                OperationRegion (ECMB, SystemIO, 0x0400, 0x02)
                Field (ECMB, ByteAcc, NoLock, Preserve)
                {
                    MIDX,   8, 
                    MDAT,   8
                }

                IndexField (MIDX, MDAT, ByteAcc, NoLock, Preserve)
                {
                    CRTP,   8, 
                    CLTP,   8, 
                    VRTP,   8, 
                    VLTP,   8, 
                            Offset (0x06), 
                    ECFG,   1, 
                            Offset (0x07), 
                    SROM,   8, 
                            Offset (0x0B), 
                    FANL,   8, 
                    FANH,   8, 
                    TBXP,   8, 
                    BRIG,   4, 
                    WSTS,   1, 
                    BSTS,   1, 
                    G3TS,   1, 
                            Offset (0x0F), 
                    MBID,   2, 
                    SKID,   1, 
                            Offset (0x10), 
                    BATS,   1, 
                    LSER,   1, 
                    LFIR,   1, 
                    LLPT,   1, 
                    LUSB,   1, 
                    L394,   1, 
                    LLAN,   1, 
                            Offset (0x11), 
                    COMD,   8, 
                    IND0,   8, 
                    IND1,   8, 
                    DAT0,   8, 
                            Offset (0x16), 
                    SKU0,   1, 
                        ,   1, 
                    VSTA,   1, 
                            Offset (0x17), 
                    WEXT,   1, 
                    BEXT,   1, 
                    G3XT,   1, 
                    WPRS,   1, 
                    BTRS,   1, 
                    G3RS,   1, 
                    BPRS,   1, 
                    CRTS,   1, 
                        ,   1, 
                    WINF,   1, 
                    DOSF,   1, 
                    TPAD,   1, 
                    WAOL,   1, 
                        ,   2, 
                    BIDF,   1, 
                    PAID,   4, 
                    CKFG,   1, 
                    CRFG,   1, 
                    F10G,   1, 
                    IOFG,   1, 
                            Offset (0x1C), 
                        ,   3, 
                    ACPT,   1, 
                            Offset (0x1D), 
                    BT0P,   1, 
                    BT1P,   1, 
                        ,   2, 
                    BCG1,   1, 
                    BCG2,   1, 
                            Offset (0x1E), 
                    BDC1,   1, 
                    BDC2,   1, 
                        ,   2, 
                    BFC1,   1, 
                    BFC2,   1, 
                            Offset (0x1F), 
                    B1L1,   1, 
                    B2L1,   1, 
                        ,   2, 
                    B1L2,   1, 
                    B2L2,   1, 
                            Offset (0x20), 
                    B1PL,   8, 
                    B1RL,   8, 
                    B1RH,   8, 
                    LF1L,   8, 
                    LF1H,   8, 
                    SN1L,   8, 
                    SN1H,   8, 
                    CR1L,   8, 
                    CR1H,   8, 
                    DVL1,   8, 
                    DVH1,   8, 
                    VLB1,   8, 
                    VHB1,   8, 
                            Offset (0x30), 
                    B2PL,   8, 
                    B2RL,   8, 
                    B2RH,   8, 
                    LF2L,   8, 
                    LF2H,   8, 
                    SN2L,   8, 
                    SN2H,   8, 
                    CR2L,   8, 
                    CR2H,   8, 
                    DVL2,   8, 
                    DVH2,   8, 
                    VLB2,   8, 
                    VHB2,   8
                }

                Name (ACPS, Zero)
                Name (RTMP, One)
                Name (TMPI, Zero)
                Method (RDEC, 1, NotSerialized)
                {
                    Sleep (0x0A)
                    Store (IND0, TMPI)
                    Store (Arg0, IND0)
                    Store (0x90, COMD)
                    Sleep (0x0A)
                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    Store (DAT0, Local0)
                    Store (TMPI, IND0)
                    Return (Local0)
                }

                Method (WREC, 2, NotSerialized)
                {
                    Sleep (0x0A)
                    Store (IND0, TMPI)
                    Store (Arg0, IND0)
                    Store (Arg1, DAT0)
                    Store (0x91, COMD)
                    Sleep (0x0A)
                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    Store (TMPI, IND0)
                }

                Method (ECW1, 2, NotSerialized)
                {
                    Store (Arg0, DAT0)
                    Store (Arg1, COMD)
                    Sleep (0x0A)
                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }

                    If (COMD)
                    {
                        Sleep (0x0A)
                    }
                }

                Name (_S0, Package (0x03)
                {
                    Zero, 
                    Zero, 
                    Zero
                })
                Name (_S3, Package (0x03)
                {
                    0x05, 
                    0x05, 
                    Zero
                })
                Name (_S4, Package (0x03)
                {
                    0x06, 
                    0x06, 
                    Zero
                })
                Name (_S5, Package (0x03)
                {
                    0x07, 
                    0x07, 
                    Zero
                })
                Method (GETP, 1, Serialized)
                {
                    If (LEqual (And (Arg0, 0x09), Zero))
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
                    Name (TMPF, Zero)
                    If (Arg0)
                    {
                        Or (TMPF, One, TMPF)
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

                            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
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
                        Return (One)
                    }

                    If (LLessEqual (Arg0, 0x1E))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x2D))
                    {
                        Return (One)
                    }

                    If (LLessEqual (Arg0, 0x3C))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x5A))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (SETT, 3, Serialized)
                {
                    If (And (Arg1, 0x02))
                    {
                        If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                        {
                            Return (0x0B)
                        }

                        If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
                        {
                            Return (0x09)
                        }
                    }

                    Return (0x04)
                }
            }

            Device (LANC)
            {
                Name (_ADR, 0x00190000)
                OperationRegion (LANF, PCI_Config, 0xCC, 0x04)
                Field (LANF, DWordAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x04
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (One, WOLE)
                    }
                    Else
                    {
                        Store (Zero, WOLE)
                    }
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)
                OperationRegion (HDAR, PCI_Config, 0x4C, 0x10)
                Field (HDAR, WordAcc, NoLock, Preserve)
                {
                    DCKA,   1, 
                            Offset (0x01), 
                    DCKM,   1, 
                        ,   6, 
                    DCKS,   1, 
                            Offset (0x08), 
                        ,   15, 
                    PMES,   1
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x04
                })
            }

            Device (DOCK)
            {
                Name (_HID, "SADDLEST")
                Name (_CID, 0x150CD041)
                Name (_UID, "SADDLESTRING")
                Method (_EJ0, 1, NotSerialized)
                {
                    P8XH (Zero, 0xED)
                    Return (One)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (DCKN)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (_DCK, 1, NotSerialized)
                {
                    P8XH (Zero, 0xD0)
                    If (Arg0)
                    {
                        P8XH (Zero, 0xDA)
                        Return (One)
                    }
                    Else
                    {
                        P8XH (Zero, 0xDB)
                        Store (Zero, DCKN)
                        Return (One)
                    }
                }

                Name (_EDL, Package (0x04)
                {
                    ^RP01.PXSX, 
                    ^EHC2.HUB7.PRT4, 
                    SATA, 
                    HDEF
                })
            }

            Scope (\)
            {
                Field (GNVS, AnyAcc, Lock, Preserve)
                {
                            Offset (0x13), 
                    DCKN,   8
                }
            }

            Device (RP01)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Name (PXSX._RMV, One)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
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
                                Zero, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKD, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
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
                                Zero, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x10
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
                                Zero, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKA, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (RP03)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Name (PXSX._RMV, One)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x11
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
                                Zero, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKB, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
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
                                Zero, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x12
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
                                Zero, 
                                ^^LPCB.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKC, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (RP05)
            {
                Name (_ADR, 0x001C0004)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }

                Name (PXSX._RMV, One)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                Zero, 
                                Zero, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
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
                                Zero, 
                                ^^LPCB.LNKA, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKD, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (RP06)
            {
                Name (_ADR, 0x001C0005)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (PXSX)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
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
                                Zero, 
                                Zero, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                Zero, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                Zero, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                Zero, 
                                0x10
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
                                Zero, 
                                ^^LPCB.LNKB, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                One, 
                                ^^LPCB.LNKC, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPCB.LNKD, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPCB.LNKA, 
                                Zero
                            }
                        })
                    }
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (Zero, U1EN)
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
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0001)
                OperationRegion (U2CS, PCI_Config, 0xC4, 0x04)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                    U2EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U2EN)
                    }
                    Else
                    {
                        Store (Zero, U2EN)
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
            }

            Device (USB3)
            {
                Name (_ADR, 0x001D0002)
                OperationRegion (U2CS, PCI_Config, 0xC4, 0x04)
                Field (U2CS, DWordAcc, NoLock, Preserve)
                {
                    U3EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U3EN)
                    }
                    Else
                    {
                        Store (Zero, U3EN)
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
            }

            Device (USB4)
            {
                Name (_ADR, 0x001A0000)
                OperationRegion (U4CS, PCI_Config, 0xC4, 0x04)
                Field (U4CS, DWordAcc, NoLock, Preserve)
                {
                    U4EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U4EN)
                    }
                    Else
                    {
                        Store (Zero, U4EN)
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
            }

            Device (USB5)
            {
                Name (_ADR, 0x001A0001)
                OperationRegion (U5CS, PCI_Config, 0xC4, 0x04)
                Field (U5CS, DWordAcc, NoLock, Preserve)
                {
                    U5EN,   2
                }

                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U5EN)
                    }
                    Else
                    {
                        Store (Zero, U5EN)
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
            }

            Device (EHC1)
            {
                Name (_ADR, 0x001D0007)
                OperationRegion (U7CS, PCI_Config, 0x54, 0x04)
                Field (U7CS, DWordAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1
                }

                Device (HUB7)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)
                    }

                    Device (PRT6)
                    {
                        Name (_ADR, 0x06)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x001A0007)
                Device (HUB7)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)
                    }
                }
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)
                Device (SLT0)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Device (SLT1)
                {
                    Name (_ADR, 0x00010000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Device (SLT2)
                {
                    Name (_ADR, 0x00020000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
                    })
                }

                Device (SLT6)
                {
                    Name (_ADR, 0x00050000)
                    Name (_PRW, Package (0x02)
                    {
                        0x0B, 
                        0x04
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
                                0x0004FFFF, 
                                Zero, 
                                Zero, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                One, 
                                Zero, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x02, 
                                Zero, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x03, 
                                Zero, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                Zero, 
                                Zero, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0007FFFF, 
                                Zero, 
                                Zero, 
                                0x16
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x03)
                        {
                            Package (0x04)
                            {
                                0x0004FFFF, 
                                Zero, 
                                ^^LPCB.LNKE, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                Zero, 
                                ^^LPCB.LNKF, 
                                Zero
                            }, 

                            Package (0x04)
                            {
                                0x0007FFFF, 
                                Zero, 
                                ^^LPCB.LNKG, 
                                Zero
                            }
                        })
                    }
                }
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
                            Offset (0x60), 
                        ,   7, 
                    C4C3,   1, 
                            Offset (0xB0), 
                    RAEN,   1, 
                        ,   13, 
                    RCBA,   18
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, One)
                    Method (_DIS, 0, Serialized)
                    {
                        Store (0x80, PARC)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, )
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLA, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLA, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PARC, 0x0F), IRQ0)
                        Return (RTLA)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
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
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLB, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLB, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PBRC, 0x0F), IRQ0)
                        Return (RTLB)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
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
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLC, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLC, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PCRC, 0x0F), IRQ0)
                        Return (RTLC)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
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
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLD, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLD, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PDRC, 0x0F), IRQ0)
                        Return (RTLD)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
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
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLE, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLE, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PERC, 0x0F), IRQ0)
                        Return (RTLE)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
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
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLF, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLF, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PFRC, 0x0F), IRQ0)
                        Return (RTLF)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
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
                            {1,3,4,5,6,7,10,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLG, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLG, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PGRC, 0x0F), IRQ0)
                        Return (RTLG)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
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
                            {1,3,4,5,6,7,11,12,14,15}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        Name (RTLH, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {}
                        })
                        CreateWordField (RTLH, One, IRQ0)
                        Store (Zero, IRQ0)
                        ShiftLeft (One, And (PHRC, 0x0F), IRQ0)
                        Return (RTLH)
                    }

                    Method (_SRS, 1, Serialized)
                    {
                        CreateWordField (Arg0, One, IRQ0)
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
                    Name (_GPE, 0x16)
                    Name (ECOK, Zero)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECOK)
                            Notify (ADP0, Zero)
                            Notify (BAT0, 0x80)
                            Notify (BAT1, 0x80)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x92), 
                        LIDS,   1, 
                        CRTS,   1, 
                        FNST,   1, 
                        ACST,   1, 
                        BL1,    1, 
                        BL2,    1, 
                        PWOR,   1, 
                        BCLW,   1, 
                        SMIE,   1, 
                        WLST,   1, 
                        WLKL,   1, 
                        WLIF,   1, 
                        BTKL,   1, 
                        BTST,   1, 
                        BTDE,   1, 
                        BTON,   1, 
                        B1ST,   1, 
                        B2ST,   1, 
                            ,   2, 
                        B1CG,   1, 
                        B2CG,   1, 
                        B1CE,   1, 
                        B2CE,   1, 
                        B1DC,   1, 
                        B2DC,   1, 
                            ,   2, 
                        B1FC,   1, 
                        B2FC,   1, 
                                Offset (0x96), 
                        L1B1,   1, 
                        L1B2,   1, 
                            ,   2, 
                        L2B1,   1, 
                        L2B2,   1, 
                                Offset (0x97), 
                                Offset (0x99), 
                        BL1P,   8, 
                        BL2P,   8, 
                                Offset (0x9C), 
                        TMPS,   7, 
                                Offset (0xA1), 
                        VFAN,   8, 
                        FANR,   8, 
                        BNDT,   8, 
                        B1BL,   8, 
                        B2BL,   8, 
                        OTMP,   8, 
                        FANC,   8, 
                        B1PR,   16, 
                        LFC1,   16, 
                        B1TR,   8, 
                        B2TR,   8, 
                        FANP,   8, 
                                Offset (0xB1), 
                        B2PR,   16, 
                        LFC2,   16, 
                                Offset (0xB8), 
                        PWST,   8, 
                        B1SN,   16, 
                        B2SN,   16, 
                                Offset (0xC4), 
                        CRCN,   8, 
                        B1RC,   16, 
                        B2RC,   16, 
                                Offset (0xCA), 
                        PTDE,   8, 
                        VGAT,   8, 
                        VGLR,   8, 
                                Offset (0xCE), 
                        CCLT,   8, 
                                Offset (0xD2), 
                        B1DV,   16, 
                        B2DV,   16, 
                        B1VL,   16, 
                        B2VL,   16, 
                                Offset (0xDD), 
                        BANE,   8, 
                                Offset (0xDF), 
                        BCEL,   8
                    }

                    Mutex (MUT1, 0x00)
                    Device (ALSD)
                    {
                        Name (_HID, "ACPI0008")
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (ALSE, 0x02))
                            {
                                Return (0x0F)
                            }

                            Return (Zero)
                        }

                        Method (_ALI, 0, NotSerialized)
                        {
                            Return (Or (ShiftLeft (LHIH, 0x08), LLOW))
                        }

                        Name (_ALR, Package (0x05)
                        {
                            Package (0x02)
                            {
                                0x46, 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                0x49, 
                                0x0A
                            }, 

                            Package (0x02)
                            {
                                0x55, 
                                0x50
                            }, 

                            Package (0x02)
                            {
                                0x64, 
                                0x012C
                            }, 

                            Package (0x02)
                            {
                                0x96, 
                                0x03E8
                            }
                        })
                        Method (ALA, 1, NotSerialized)
                        {
                            Store (Arg0, ALAF)
                            BRTW (BRTL)
                        }
                    }

                    Device (EMAD)
                    {
                        Name (_HID, "ACPIEMAD")
                        OperationRegion (PRVT, SystemIO, 0x06A0, 0x08)
                        Field (PRVT, ByteAcc, NoLock, Preserve)
                        {
                            PVT0,   8, 
                                    Offset (0x04), 
                            PVT1,   8
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            If (EMAE)
                            {
                                Return (0x0F)
                            }

                            Return (Zero)
                        }

                        Method (BLKW, 3, Serialized)
                        {
                            If (PIBC (0x1388))
                            {
                                Return (Zero)
                            }

                            Store (Zero, EMAP)
                            If (LLess (SizeOf (Arg2), 0x20))
                            {
                                Store (SizeOf (Arg2), EMAL)
                            }
                            Else
                            {
                                Store (0x20, EMAL)
                            }

                            While (LLess (EMAP, SizeOf (Arg2)))
                            {
                                Store (0xAC, PVT0)
                                If (IBFC (0x03E8))
                                {
                                    Return (Zero)
                                }

                                Store (Arg0, PVT0)
                                If (IBFC (0x03E8))
                                {
                                    Return (Zero)
                                }

                                Store (Arg1, PVT0)
                                If (IBFC (0x03E8))
                                {
                                    Return (Zero)
                                }

                                Store (EMAL, PVT0)
                                If (IBFC (0x03E8))
                                {
                                    Return (Zero)
                                }

                                Store (Zero, Local0)
                                While (LLess (Local0, EMAL))
                                {
                                    Store (DerefOf (Index (Arg2, EMAP)), PVT0)
                                    If (IBFC (0x03E8))
                                    {
                                        Return (Zero)
                                    }

                                    Increment (Local0)
                                    Increment (EMAP)
                                }

                                If (PIBC (0x1388))
                                {
                                    Return (Zero)
                                }

                                If (LGreater (Add (EMAP, EMAL), SizeOf (Arg2)))
                                {
                                    Subtract (SizeOf (Arg2), EMAP, EMAL)
                                }
                            }

                            Return (One)
                        }

                        Method (GSTS, 1, Serialized)
                        {
                            If (PIBC (0x1388))
                            {
                                Return (0xFFFF)
                            }

                            Store (0xAD, PVT0)
                            If (IBFC (0x03E8))
                            {
                                Return (0xFFFF)
                            }

                            Store (Arg0, PVT0)
                            If (IBFC (0x03E8))
                            {
                                Return (0xFFFF)
                            }

                            If (OBFC (0x09C4))
                            {
                                Return (PVT0)
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }
                        }

                        Method (IBFC, 1, Serialized)
                        {
                            Store (Arg0, Local0)
                            While (LAnd (And (PVT1, 0x02), Local0))
                            {
                                Decrement (Local0)
                                Stall (One)
                            }

                            Return (And (PVT1, 0x02))
                        }

                        Method (OBFC, 1, Serialized)
                        {
                            Store (Arg0, Local0)
                            While (LAnd (LEqual (And (PVT1, One), Zero), Local0))
                            {
                                Decrement (Local0)
                                Stall (0x0A)
                            }

                            Return (And (PVT1, One))
                        }

                        Method (PIBC, 1, Serialized)
                        {
                            Store (Arg0, Local0)
                            While (LAnd (And (PVT1, 0x04), Local0))
                            {
                                Decrement (Local0)
                                Stall (0x64)
                            }

                            Return (And (PVT1, 0x04))
                        }
                    }

                    Scope (\)
                    {
                        Field (GNVS, AnyAcc, Lock, Preserve)
                        {
                                    Offset (0x1F), 
                            B0SC,   8, 
                                    Offset (0x22), 
                            B0SS,   8
                        }
                    }

                    Device (BAT0)
                    {
                        Name (_HID, EisaId ("PNP0C0A"))
                        Name (_UID, One)
                        Name (_PCL, Package (0x01)
                        {
                            _SB
                        })
                        Name (BIF0, Package (0x0D)
                        {
                            One, 
                            0x10CC, 
                            0x10CC, 
                            One, 
                            0x3A98, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            "Main", 
                            "0000", 
                            "Li-ion", 
                            ""
                        })
                        Name (BST0, Package (0x04)
                        {
                            One, 
                            0x0A90, 
                            0x1000, 
                            0x2A30
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (ECOK)
                            {
                                Store (BT0P, Local0)
                                If (LAnd (Local0, One))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x0F)
                                }
                            }
                            Else
                            {
                                Return (0x1F)
                            }
                        }

                        Method (_BIF, 0, NotSerialized)
                        {
                            If (ECOK)
                            {
                                Store (LF1L, Local0)
                                Store (LF1H, Local1)
                                ShiftLeft (Local1, 0x08, Local1)
                                Add (Local0, Local1, Local0)
                                Store (Local0, Index (BIF0, 0x02))
                                Store (DVL1, Local4)
                                Store (DVH1, Local5)
                                ShiftLeft (Local5, 0x08, Local5)
                                Add (Local4, Local5, Local4)
                                Store (Local4, Index (BIF0, 0x04))
                                Store (Zero, Local2)
                                Store (Local2, Index (BIF0, 0x05))
                                Store (Zero, Local4)
                                Store (Local4, Index (BIF0, 0x06))
                                Subtract (Local2, Local4, Local6)
                                Store (Local6, Index (BIF0, 0x07))
                                Subtract (Local0, Local2, Local7)
                                Store (Local7, Index (BIF0, 0x08))
                                Store (RDEC (0xDD), Local0)
                                If (LEqual (Local0, Zero))
                                {
                                    Store ("3UR18650Y", Index (BIF0, 0x09))
                                }

                                If (LEqual (Local0, One))
                                {
                                    Store ("4UR18650Y", Index (BIF0, 0x09))
                                }

                                If (LEqual (Local0, 0x02))
                                {
                                    Store ("LIP6219IVPC", Index (BIF0, 0x09))
                                }

                                If (LEqual (Local0, 0x03))
                                {
                                    Store ("LIP8216IVPC", Index (BIF0, 0x09))
                                }

                                Store (SN1L, Local0)
                                Store (SN1H, Local5)
                                ShiftLeft (Local5, 0x08, Local5)
                                Add (Local0, Local5, Local0)
                                Store (ITOS (Local0), Local1)
                                Store (Local1, Index (BIF0, 0x0A))
                            }

                            Return (BIF0)
                        }

                        Method (_BST, 0, NotSerialized)
                        {
                            If (WINF)
                            {
                                Store (One, Index (BST0, Zero))
                                Store (0x78, Index (BST0, One))
                                Store (0x0BB8, Index (BST0, 0x02))
                                Store (0x3A98, Index (BST0, 0x03))
                                Return (BST0)
                            }
                            Else
                            {
                                If (ECOK)
                                {
                                    Store (BCG1, Local1)
                                    Store (And (Local1, One), Local1)
                                    ShiftLeft (Local1, One, Local2)
                                    Store (BDC1, Local0)
                                    Store (And (Local0, One), Local0)
                                    Or (Local0, Local2, Local3)
                                    Store (CR1H, Local2)
                                    Multiply (Local2, 0x0100, Local1)
                                    Store (CR1L, Local0)
                                    Add (Local1, Local0, Local1)
                                    Store (Local1, Index (BST0, One))
                                    Store (B1PL, Local0)
                                    Store (And (Local0, 0x7F), Local0)
                                    If (LLess (Local0, 0x0F))
                                    {
                                        Or (Local3, 0x04, Local3)
                                    }

                                    Store (Local3, Index (BST0, Zero))
                                    Store (DerefOf (Index (BIF0, 0x02)), Local1)
                                    Multiply (Local1, Local0, Local2)
                                    Divide (Local2, 0x64, Local3, Local2)
                                    Add (Local2, 0x0A, Local2)
                                    Store (Local2, Index (BST0, 0x02))
                                    Store (VLB1, Local4)
                                    Store (VHB1, Local5)
                                    ShiftLeft (Local5, 0x08, Local5)
                                    Add (Local4, Local5, Local4)
                                    Store (Local4, Index (BST0, 0x03))
                                }
                                Else
                                {
                                    Store (One, Index (BST0, Zero))
                                    Store (0x78, Index (BST0, One))
                                    Store (0x0BB8, Index (BST0, 0x02))
                                    Store (0x3A98, Index (BST0, 0x03))
                                }

                                Return (BST0)
                            }
                        }
                    }

                    Method (ITOS, 1, NotSerialized)
                    {
                        Store ("", Local0)
                        Store (0x04, Local1)
                        While (Local1)
                        {
                            Decrement (Local1)
                            And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
                            Store (DerefOf (Index (CHAR, Local4)), Local2)
                            Concatenate (Local0, Local2, Local5)
                            Store (Local5, Local0)
                        }

                        Return (Local0)
                    }

                    Name (CHAR, Package (0x10)
                    {
                        "0", 
                        "1", 
                        "2", 
                        "3", 
                        "4", 
                        "5", 
                        "6", 
                        "7", 
                        "8", 
                        "9", 
                        "A", 
                        "B", 
                        "C", 
                        "D", 
                        "E", 
                        "F"
                    })
                    Device (BAT1)
                    {
                        Name (_HID, EisaId ("PNP0C0A"))
                        Name (_UID, 0x02)
                        Name (_PCL, Package (0x01)
                        {
                            _SB
                        })
                        Name (BIF1, Package (0x0D)
                        {
                            One, 
                            0x10CC, 
                            0x10CC, 
                            One, 
                            0x3A98, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            "Main", 
                            "0000", 
                            "Li-ion", 
                            ""
                        })
                        Name (BST1, Package (0x04)
                        {
                            One, 
                            0x0A90, 
                            0x1000, 
                            0x2A30
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (ECOK)
                            {
                                Store (BT1P, Local0)
                                If (LAnd (Local0, One))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x0F)
                                }
                            }
                            Else
                            {
                                Return (0x1F)
                            }
                        }

                        Method (_BIF, 0, NotSerialized)
                        {
                            If (ECOK)
                            {
                                Store (LF2L, Local0)
                                Store (LF2H, Local1)
                                ShiftLeft (Local1, 0x08, Local1)
                                Add (Local0, Local1, Local0)
                                Store (Local0, Index (BIF1, 0x02))
                                Store (DVL2, Local4)
                                Store (DVH2, Local5)
                                ShiftLeft (Local5, 0x08, Local5)
                                Add (Local4, Local5, Local4)
                                Store (Local4, Index (BIF1, 0x04))
                                Store (Zero, Local2)
                                Store (Local2, Index (BIF1, 0x05))
                                Store (Zero, Local4)
                                Store (Local4, Index (BIF1, 0x06))
                                Subtract (Local2, Local4, Local6)
                                Store (Local6, Index (BIF1, 0x07))
                                Subtract (Local0, Local2, Local7)
                                Store (Local7, Index (BIF1, 0x08))
                                Store ("3UF103450P", Index (BIF1, 0x09))
                                Store (SN2L, Local0)
                                Store (SN2H, Local5)
                                ShiftLeft (Local5, 0x08, Local5)
                                Add (Local0, Local5, Local0)
                                Store (ITOS (Local0), Local1)
                                Store (Local1, Index (BIF1, 0x0A))
                            }

                            Return (BIF1)
                        }

                        Method (_BST, 0, NotSerialized)
                        {
                            If (WINF)
                            {
                                Store (One, Index (BST1, Zero))
                                Store (0x78, Index (BST1, One))
                                Store (0x0BB8, Index (BST1, 0x02))
                                Store (0x3A98, Index (BST1, 0x03))
                                Return (BST1)
                            }
                            Else
                            {
                                If (ECOK)
                                {
                                    Store (BCG2, Local1)
                                    Store (And (Local1, One), Local1)
                                    ShiftLeft (Local1, One, Local2)
                                    Store (BDC2, Local0)
                                    Store (And (Local0, One), Local0)
                                    Or (Local0, Local2, Local3)
                                    Store (CR2H, Local2)
                                    Multiply (Local2, 0x0100, Local1)
                                    Store (CR2L, Local0)
                                    Add (Local1, Local0, Local1)
                                    Store (Local1, Index (BST1, One))
                                    Store (B2PL, Local0)
                                    Store (And (Local0, 0x7F), Local0)
                                    If (LLess (Local0, 0x0F))
                                    {
                                        Or (Local3, 0x04, Local3)
                                    }

                                    Store (Local3, Index (BST1, Zero))
                                    Store (DerefOf (Index (BIF1, 0x02)), Local1)
                                    Multiply (Local1, Local0, Local2)
                                    Divide (Local2, 0x64, Local3, Local2)
                                    Store (Local2, Index (BST1, 0x02))
                                    Store (VLB2, Local4)
                                    Store (VHB2, Local5)
                                    ShiftLeft (Local5, 0x08, Local5)
                                    Add (Local4, Local5, Local4)
                                    Store (Local4, Index (BST1, 0x03))
                                }
                                Else
                                {
                                    Store (One, Index (BST1, Zero))
                                    Store (0x78, Index (BST1, One))
                                    Store (0x0BB8, Index (BST1, 0x02))
                                    Store (0x3A98, Index (BST1, 0x03))
                                }

                                Return (BST1)
                            }
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (Zero, DFEC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (One, DFEC)
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
                    Method (_Q12, 0, NotSerialized)
                    {
                        Notify (\_TZ.TZ00, 0x80)
                        Notify (\_TZ.TZ01, 0x80)
                        Notify (\_TZ.TZVR, 0x80)
                        Notify (\_TZ.TZVL, 0x80)
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Notify (ADP0, Zero)
                        Notify (BAT0, 0x80)
                        Notify (BAT0, 0x81)
                        Notify (BAT1, 0x80)
                        Notify (BAT1, 0x81)
                    }

                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (And (RDEC (0x92), One), Local0)
                        If (LEqual (Local0, One))
                        {
                            Store (One, LIDF)
                        }
                        Else
                        {
                            Store (Zero, LIDF)
                        }

                        Notify (LID, 0x80)
                    }

                    Method (_Q19, 0, NotSerialized)
                    {
                        Notify (BAT0, 0x81)
                        Notify (BAT0, 0x80)
                        Notify (BAT1, 0x81)
                        Notify (BAT1, 0x80)
                    }

                    Method (_Q29, 0, NotSerialized)
                    {
                        If (^^^^WMID.BAEF)
                        {
                            Notify (WMID, 0x82)
                        }
                    }

                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x32, PRM0)
                        Store (0x89, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, PRM0)
                        Store (0x89, SMIF)
                        Store (Zero, TRP0)
                    }

                    Method (_Q50, 0, NotSerialized)
                    {
                        If (BPRS)
                        {
                            If (BIDF)
                            {
                                If (SKU0)
                                {
                                    Notify (^^^PEGP.EVGA.LCD, 0x86)
                                }

                                Notify (^^^GFX0.LCD, 0x86)
                            }
                            Else
                            {
                                If (SKU0)
                                {
                                    Notify (^^^PEGP.EVGA.LCD, 0x87)
                                }

                                Notify (^^^GFX0.LCD, 0x87)
                            }
                        }

                        If (^^^^WMID.BAEF)
                        {
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q51, 0, NotSerialized)
                    {
                        If (IGDS)
                        {
                            Store (0x27, PRM0)
                            Store (0x89, SMIF)
                            Store (Zero, TRP0)
                        }
                    }

                    Method (_Q52, 0, NotSerialized)
                    {
                        If (IGDS)
                        {
                            If (LLess (BRTL, 0x64))
                            {
                                BRTW (Add (BRTL, 0x0A))
                            }
                        }
                    }

                    Method (_Q53, 0, NotSerialized)
                    {
                        If (IGDS)
                        {
                            If (LGreater (BRTL, 0x0A))
                            {
                                BRTW (Subtract (BRTL, 0x0A))
                            }
                        }
                    }
                }

                Scope (\_SB)
                {
                    Device (ADP0)
                    {
                        Name (_PCL, Package (0x01)
                        {
                            _SB
                        })
                        Name (_HID, "ACPI0003")
                        Method (_PSR, 0, NotSerialized)
                        {
                            If (WINF)
                            {
                                Return (One)
                            }
                            Else
                            {
                                If (^^PCI0.LPCB.EC0.ECOK)
                                {
                                    Store (ACPT, Local0)
                                    Store (And (Local0, One), Local0)
                                    If (Local0)
                                    {
                                        Store (One, PWRS)
                                        Return (One)
                                    }
                                    Else
                                    {
                                        Store (Zero, PWRS)
                                        Return (Zero)
                                    }
                                }
                                Else
                                {
                                    Return (One)
                                }
                            }
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0F)
                        }
                    }

                    Device (SLPB)
                    {
                        Name (_HID, EisaId ("PNP0C0E"))
                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0B)
                        }
                    }

                    Name (LIDF, One)
                    Device (LID)
                    {
                        Name (_HID, EisaId ("PNP0C0D"))
                        Method (_LID, 0, NotSerialized)
                        {
                            Return (LIDF)
                        }

                        Name (_PRW, Package (0x02)
                        {
                            0x19, 
                            0x04
                        })
                    }

                    Device (PWRB)
                    {
                        Name (_HID, EisaId ("PNP0C0C"))
                        Name (_PRW, Package (0x02)
                        {
                            0x18, 
                            0x04
                        })
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
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (_CID, 0x010CD041)
                    Name (BUF0, ResourceTemplate ()
                    {
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

                        Return (Zero)
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPCB.HPET._Y16._BAS, HPT0)
                            If (LEqual (HPAS, One))
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

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x02)
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
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x01F8,             // Range Minimum
                            0x01F8,             // Range Maximum
                            0x01,               // Alignment
                            0x7C,               // Length
                            )
                        IO (Decode16,
                            0x0680,             // Range Minimum
                            0x0680,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
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
                            0x1640,             // Range Minimum
                            0x1640,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
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
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
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
                }

                Name (Z000, 0x0F)
                Name (Z001, 0x0D)
                Name (Z002, Zero)
                Name (Z003, 0x04)
                Name (Z004, 0x02)
                Name (Z005, 0x03)
                Name (Z006, 0x09)
                Name (Z007, 0x70)
                Name (Z008, Zero)
                Name (Z009, 0x10)
                Name (Z00A, 0x20)
                Name (Z00B, 0x40)
                Name (Z00C, 0x03)
                Name (Z00D, Zero)
                Name (Z00E, One)
                Name (Z00F, 0x02)
                Name (Z00G, 0x03)
                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Name (_UID, One)
                    OperationRegion (SIIO, SystemIO, 0x2E, 0x0100)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        SIOI,   8, 
                        SIOD,   8
                    }

                    IndexField (SIOI, SIOD, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x02), 
                        CR02,   8, 
                                Offset (0x07), 
                        CR07,   8, 
                                Offset (0x20), 
                        CR20,   8, 
                                Offset (0x27), 
                        CR27,   8, 
                                Offset (0x30), 
                        CR30,   8, 
                                Offset (0x60), 
                        CR60,   8, 
                        CR61,   8, 
                        CR62,   8, 
                        CR63,   8, 
                                Offset (0x70), 
                        CR70,   8, 
                                Offset (0x74), 
                        CR74,   8, 
                        CR75,   8, 
                                Offset (0xF0), 
                        CRF0,   8
                    }

                    Mutex (SIOM, 0x00)
                    Method (ENCM, 1, NotSerialized)
                    {
                        Acquire (SIOM, 0xFFFF)
                        Store (0x83, SIOI)
                        Store (0x05, SIOI)
                        Store (0x55, SIOI)
                        Store (0x55, SIOI)
                        Store (Arg0, CR07)
                    }

                    Method (EXCM, 0, NotSerialized)
                    {
                        Store (0x02, SIOI)
                        Store (0x02, SIOD)
                        Release (SIOM)
                    }

                    Method (EDEV, 5, NotSerialized)
                    {
                        ENCM (Arg0)
                        And (Arg1, 0xFF, CR61)
                        ShiftRight (Arg1, 0x08, CR60)
                        And (Arg2, 0xFF, CR63)
                        ShiftRight (Arg2, 0x08, CR62)
                        FindSetRightBit (Arg3, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        Store (Local0, CR70)
                        FindSetRightBit (Arg4, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        Store (Local0, CR74)
                        Store (One, CR30)
                        EXCM ()
                    }

                    Method (DDEV, 1, NotSerialized)
                    {
                        ENCM (Arg0)
                        Store (Zero, CR30)
                        Store (Zero, CR60)
                        Store (Zero, CR61)
                        Store (Zero, CR62)
                        Store (Zero, CR63)
                        Store (Zero, CR70)
                        Store (Zero, CR74)
                        EXCM ()
                    }

                    Device (COMA)
                    {
                        Name (_HID, EisaId ("PNP0501"))
                        Name (_UID, One)
                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y17)
                            IRQNoFlags (_Y18)
                                {}
                        })
                        Method (_PRS, 0, NotSerialized)
                        {
                            Return (ResourceTemplate ()
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
                                        {4}
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
                                        {3}
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
                                        {4}
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
                                        {3}
                                }
                                EndDependentFn ()
                            })
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            ENCM (Z005)
                            And (CR30, One, Local0)
                            Store (CR60, Local1)
                            EXCM ()
                            If (LAnd (Local0, LNotEqual (Local1, Zero)))
                            {
                                Return (Z000)
                            }
                            Else
                            {
                                If (LNotEqual (LAnd (CR60, CR61), Zero))
                                {
                                    Return (Z001)
                                }
                                Else
                                {
                                    Return (Z002)
                                }
                            }
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            Store (Arg0, RSRC)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.COMA._Y17._MIN, MIN1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.COMA._Y18._INT, IRQX)
                            EDEV (Z005, MIN1, Zero, IRQX, Zero)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.COMA._Y17._MIN, MIN1)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.COMA._Y17._MAX, MAX1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.COMA._Y17._ALN, ALN1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.COMA._Y17._LEN, LEN1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.COMA._Y18._INT, IRQX)
                            Store (Zero, MIN1)
                            Store (Zero, MAX1)
                            Store (Zero, ALN1)
                            Store (Zero, LEN1)
                            Store (Zero, IRQX)
                            ENCM (Z005)
                            And (CR30, One, Local0)
                            Store (CR60, Local1)
                            EXCM ()
                            If (LOr (LEqual (Local0, Zero), LEqual (Local1, Zero)))
                            {
                                Return (RSRC)
                            }

                            ENCM (Z005)
                            Store (CR61, Local0)
                            Store (CR60, Local1)
                            ShiftLeft (Local1, 0x08, Local1)
                            Or (Local0, Local1, MIN1)
                            Store (MIN1, MAX1)
                            Store (One, ALN1)
                            Store (0x08, LEN1)
                            Store (CR70, Local0)
                            ShiftLeft (One, Local0, IRQX)
                            EXCM ()
                            Return (RSRC)
                        }
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("ITE8706"))
                        Name (_UID, One)
                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x20,               // Alignment
                                0x20,               // Length
                                _Y19)
                            IRQNoFlags (_Y1A)
                                {}
                        })
                        Method (_PRS, 0, NotSerialized)
                        {
                            Return (ResourceTemplate ()
                            {
                                StartDependentFnNoPri ()
                                {
                                    IO (Decode16,
                                        0x0300,             // Range Minimum
                                        0x0300,             // Range Maximum
                                        0x20,               // Alignment
                                        0x20,               // Length
                                        )
                                    IRQNoFlags ()
                                        {3}
                                    DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                        {0}
                                }
                                EndDependentFn ()
                            })
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            ENCM (Z004)
                            And (CR30, One, Local0)
                            Store (CR60, Local1)
                            EXCM ()
                            If (LAnd (Local0, LNotEqual (Local1, Zero)))
                            {
                                Return (Z000)
                            }
                            Else
                            {
                                If (LNotEqual (LAnd (CR60, CR61), Zero))
                                {
                                    Return (Z001)
                                }
                                Else
                                {
                                    Return (Z002)
                                }
                            }
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            DDEV (Z004)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            Store (Arg0, RSRC)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.FIR._Y19._MIN, MIN1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.FIR._Y1A._INT, IRQX)
                            EDEV (Z004, MIN1, Zero, IRQX, Zero)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.FIR._Y19._MIN, MIN1)
                            CreateWordField (RSRC, \_SB.PCI0.LPCB.SIO.FIR._Y19._MAX, MAX1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.FIR._Y19._ALN, ALN1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.FIR._Y19._LEN, LEN1)
                            CreateByteField (RSRC, \_SB.PCI0.LPCB.SIO.FIR._Y1A._INT, IRQX)
                            Store (Zero, MIN1)
                            Store (Zero, MAX1)
                            Store (Zero, ALN1)
                            Store (Zero, LEN1)
                            Store (Zero, IRQX)
                            ENCM (Z004)
                            And (CR30, One, Local0)
                            Store (CR60, Local1)
                            EXCM ()
                            If (LOr (LEqual (Local0, Zero), LEqual (Local1, Zero)))
                            {
                                Return (RSRC)
                            }

                            ENCM (Z004)
                            Store (CR61, Local0)
                            Store (CR60, Local1)
                            ShiftLeft (Local1, 0x08, Local1)
                            Or (Local0, Local1, MIN1)
                            Store (MIN1, MAX1)
                            Store (One, ALN1)
                            Store (0x08, LEN1)
                            Store (CR70, Local0)
                            ShiftLeft (One, Local0, IRQX)
                            EXCM ()
                            Return (RSRC)
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            ENCM (Z004)
                            And (CR30, One, Local0)
                            EXCM ()
                            If (Local0)
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (0x03)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            ENCM (Z004)
                            Store (One, CR30)
                            EXCM ()
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            ENCM (Z004)
                            Store (Zero, CR30)
                            EXCM ()
                        }
                    }

                    Device (LPT)
                    {
                        Method (_HID, 0, NotSerialized)
                        {
                            ENCM (Z006)
                            And (CRF0, Z00C, Local0)
                            EXCM ()
                            If (LOr (LEqual (Local0, Z00D), LEqual (Local0, Z00E)))
                            {
                                Return (0x0004D041)
                            }
                            Else
                            {
                                Return (0x0104D041)
                            }
                        }

                        Name (RSR0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y1B)
                            IRQNoFlags (_Y1C)
                                {}
                        })
                        Name (RSR1, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _Y1D)
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
                        Name (PRS0, ResourceTemplate ()
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
                        Name (PRS1, ResourceTemplate ()
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
                            EndDependentFn ()
                        })
                        Name (PRS2, ResourceTemplate ()
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
                        Name (PRS3, ResourceTemplate ()
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
                            EndDependentFn ()
                        })
                        Method (_PRS, 0, NotSerialized)
                        {
                            ENCM (Z006)
                            And (CRF0, Z00C, Local0)
                            EXCM ()
                            If (LEqual (Local0, Z00D))
                            {
                                Return (PRS0)
                            }
                            Else
                            {
                                If (LEqual (Local0, Z00E))
                                {
                                    Return (PRS1)
                                }
                                Else
                                {
                                    If (LEqual (Local0, Z00F))
                                    {
                                        Return (PRS2)
                                    }
                                    Else
                                    {
                                        Return (PRS3)
                                    }
                                }
                            }
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            ENCM (Z006)
                            And (CR30, One, Local0)
                            Store (CR60, Local1)
                            EXCM ()
                            If (LAnd (Local0, LNotEqual (Local1, Zero)))
                            {
                                Return (Z000)
                            }
                            Else
                            {
                                Return (Z001)
                            }
                        }

                        Method (_DIS, 0, NotSerialized)
                        {
                            DDEV (Z006)
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            ENCM (Z006)
                            And (CRF0, Z00C, Local0)
                            EXCM ()
                            If (LOr (LEqual (Local0, Z00D), LEqual (Local0, Z00E)))
                            {
                                Store (Arg0, RSR0)
                                CreateWordField (RSR0, \_SB.PCI0.LPCB.SIO.LPT._Y1B._MIN, MIN0)
                                CreateByteField (RSR0, \_SB.PCI0.LPCB.SIO.LPT._Y1C._INT, IRQY)
                                EDEV (Z006, MIN0, Zero, IRQY, Zero)
                            }
                            Else
                            {
                                Store (Arg0, RSR1)
                                CreateWordField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1D._MIN, MIN1)
                                CreateWordField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1E._MIN, MIN2)
                                CreateByteField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1F._INT, IRQX)
                                CreateByteField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y20._DMA, DMAX)
                                EDEV (Z006, MIN1, MIN2, IRQX, DMAX)
                            }
                        }

                        Method (CRS0, 0, NotSerialized)
                        {
                            CreateWordField (RSR0, \_SB.PCI0.LPCB.SIO.LPT._Y1B._MIN, MIN0)
                            CreateWordField (RSR0, \_SB.PCI0.LPCB.SIO.LPT._Y1B._MAX, MAX0)
                            CreateByteField (RSR0, \_SB.PCI0.LPCB.SIO.LPT._Y1B._ALN, ALN0)
                            CreateByteField (RSR0, \_SB.PCI0.LPCB.SIO.LPT._Y1B._LEN, LEN0)
                            CreateByteField (RSR0, \_SB.PCI0.LPCB.SIO.LPT._Y1C._INT, IRQY)
                            Store (Zero, MIN0)
                            Store (Zero, MAX0)
                            Store (Zero, ALN0)
                            Store (Zero, LEN0)
                            Store (Zero, IRQY)
                            ENCM (Z006)
                            And (CR30, One, Local0)
                            Store (CR60, Local1)
                            EXCM ()
                            If (LOr (LEqual (Local0, Zero), LEqual (Local1, Zero)))
                            {
                                Return (RSR0)
                            }

                            ENCM (Z006)
                            Store (CR61, Local0)
                            Store (CR60, Local1)
                            ShiftLeft (Local1, 0x08, Local1)
                            Or (Local0, Local1, MIN0)
                            Store (MIN0, MAX0)
                            Store (One, ALN0)
                            Store (0x08, LEN0)
                            Store (CR70, Local0)
                            ShiftLeft (One, Local0, IRQY)
                            EXCM ()
                            Return (RSR0)
                        }

                        Method (CRS1, 0, NotSerialized)
                        {
                            CreateWordField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1D._MIN, MIN1)
                            CreateWordField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1D._MAX, MAX1)
                            CreateByteField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1D._ALN, ALN1)
                            CreateByteField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1D._LEN, LEN1)
                            CreateWordField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1E._MIN, MIN2)
                            CreateWordField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1E._MAX, MAX2)
                            CreateByteField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1E._ALN, ALN2)
                            CreateByteField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1E._LEN, LEN2)
                            CreateByteField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y1F._INT, IRQX)
                            CreateByteField (RSR1, \_SB.PCI0.LPCB.SIO.LPT._Y20._DMA, DMAX)
                            Store (Zero, MIN1)
                            Store (Zero, MAX1)
                            Store (Zero, ALN1)
                            Store (Zero, LEN1)
                            Store (Zero, MIN2)
                            Store (Zero, MAX2)
                            Store (Zero, ALN2)
                            Store (Zero, LEN2)
                            Store (Zero, IRQX)
                            Store (Zero, DMAX)
                            ENCM (Z006)
                            And (CR30, One, Local0)
                            Store (CR60, Local1)
                            EXCM ()
                            If (LOr (LEqual (Local0, Zero), LEqual (Local1, Zero)))
                            {
                                Return (RSR1)
                            }

                            ENCM (Z006)
                            Store (CR61, Local0)
                            Store (CR60, Local1)
                            ShiftLeft (Local1, 0x08, Local1)
                            Or (Local0, Local1, MIN1)
                            Store (MIN1, MAX1)
                            Store (CR63, Local0)
                            Store (CR62, Local1)
                            ShiftLeft (Local1, 0x08, Local1)
                            Or (Local0, Local1, MIN2)
                            Store (MIN2, MAX2)
                            Store (CR70, Local0)
                            ShiftLeft (One, Local0, IRQX)
                            Store (CR74, Local0)
                            ShiftLeft (One, Local0, DMAX)
                            If (LEqual (CR61, 0xBC))
                            {
                                Store (0x08, ALN1)
                                Store (0x03, LEN1)
                            }

                            EXCM ()
                            Return (RSR1)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            ENCM (Z006)
                            And (CRF0, Z00C, Local0)
                            EXCM ()
                            If (LOr (LEqual (Local0, Z00D), LEqual (Local0, Z00E)))
                            {
                                Return (CRS0 ())
                            }
                            Else
                            {
                                Return (CRS1 ())
                            }
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            ENCM (Z006)
                            And (CR30, One, Local0)
                            EXCM ()
                            If (Local0)
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (0x03)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            ENCM (Z006)
                            Store (One, CR30)
                            EXCM ()
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            ENCM (Z006)
                            Store (Zero, CR30)
                            EXCM ()
                        }
                    }
                }

                Device (TPM)
                {
                    Name (_HID, EisaId ("IFX0102"))
                    Name (_CID, 0x310CD041)
                    Name (_UID, One)
                    Name (_STR, Unicode ("Infineon Trusted Platform Module"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (TPRS)
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0xFED40000,         // Address Base
                            0x00005000,         // Address Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x1670,             // Range Minimum
                            0x1670,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {11}
                    })
                    Method (UCMP, 2, NotSerialized)
                    {
                        If (LNotEqual (0x10, SizeOf (Arg0)))
                        {
                            Return (Zero)
                        }

                        If (LNotEqual (0x10, SizeOf (Arg1)))
                        {
                            Return (Zero)
                        }

                        Store (Zero, Local0)
                        While (LLess (Local0, 0x10))
                        {
                            If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (
                                Arg1, Local0))))
                            {
                                Return (Zero)
                            }

                            Increment (Local0)
                        }

                        Return (One)
                    }

                    Method (_DSM, 4, Serialized)
                    {
                        If (LEqual (UCMP (Arg0, Buffer (0x10)
                                    {
                                        /* 0000 */    0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E, 
                                        /* 0008 */    0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                                    }), One))
                        {
                            If (LEqual (Arg2, Zero))
                            {
                                Return (Buffer (One)
                                {
                                    0x7F
                                })
                            }

                            If (LEqual (Arg2, One))
                            {
                                Return (Buffer (0x04)
                                {
                                    "1.0"
                                })
                            }

                            If (LEqual (Arg2, 0x02))
                            {
                                If (TPRS)
                                {
                                    If (LEqual (DerefOf (Index (Arg3, Zero)), Zero))
                                    {
                                        Store (Zero, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), One))
                                    {
                                        Store (One, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x02))
                                    {
                                        Store (0x02, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x03))
                                    {
                                        Store (0x03, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x04))
                                    {
                                        Store (0x04, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x05))
                                    {
                                        Store (0x05, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x06))
                                    {
                                        Store (0x06, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x07))
                                    {
                                        Store (0x07, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x08))
                                    {
                                        Store (0x08, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x09))
                                    {
                                        Store (0x09, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0A))
                                    {
                                        Store (0x0A, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0B))
                                    {
                                        Store (0x0B, PPRQ)
                                        Return (Zero)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0C))
                                    {
                                        Store (Zero, PPRQ)
                                        Return (One)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0D))
                                    {
                                        Store (Zero, PPRQ)
                                        Return (One)
                                    }

                                    If (LEqual (DerefOf (Index (Arg3, Zero)), 0x0E))
                                    {
                                        Store (0x0E, PPRQ)
                                        Return (Zero)
                                    }

                                    Return (One)
                                }

                                Return (One)
                            }

                            If (LEqual (Arg2, 0x03))
                            {
                                Name (TMP1, Package (0x02)
                                {
                                    Zero, 
                                    0xFFFFFFFF
                                })
                                Store (PPRQ, Index (TMP1, One))
                                Return (TMP1)
                            }

                            If (LEqual (Arg2, 0x04))
                            {
                                Return (One)
                            }

                            If (LEqual (Arg2, 0x05))
                            {
                                Name (TMP2, Package (0x03)
                                {
                                    Zero, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF
                                })
                                Store (PPLO, Index (TMP2, One))
                                If (LOr (LOr (LGreater (PPLO, 0x0E), LEqual (PPLO, 0x0C)), LEqual (
                                    PPLO, 0x0D)))
                                {
                                    Store (0xFFFFFFF1, Index (TMP2, 0x02))
                                    Return (TMP2)
                                }

                                If (LEqual (PPRP, 0xFF))
                                {
                                    Store (0xFFFFFFF1, Index (TMP2, 0x02))
                                    Return (TMP2)
                                }

                                If (PPOR)
                                {
                                    Store (0xFFFFFFF0, Index (TMP2, 0x02))
                                    Return (TMP2)
                                }

                                Store (PPRP, Index (TMP2, 0x02))
                                Return (TMP2)
                            }

                            If (LEqual (Arg2, 0x06))
                            {
                                CreateByteField (Arg3, 0x04, LAN0)
                                CreateByteField (Arg3, 0x05, LAN1)
                                Or (ShiftLeft (LAN1, 0x08), LAN0, P80H)
                                If (LOr (LEqual (LAN0, 0x65), LEqual (LAN0, 0x45)))
                                {
                                    If (LOr (LEqual (LAN1, 0x6E), LEqual (LAN1, 0x4E)))
                                    {
                                        Return (Zero)
                                    }
                                }

                                Return (One)
                            }

                            Return (One)
                        }

                        If (LEqual (UCMP (Arg0, Buffer (0x10)
                                    {
                                        /* 0000 */    0xED, 0x54, 0x60, 0x37, 0x13, 0xCC, 0x75, 0x46, 
                                        /* 0008 */    0x90, 0x1C, 0x47, 0x56, 0xD7, 0xF2, 0xD4, 0x5D
                                    }), One))
                        {
                            If (LEqual (Arg2, Zero))
                            {
                                Return (Buffer (One)
                                {
                                    0x01
                                })
                            }

                            If (LEqual (Arg2, One))
                            {
                                If (LEqual (DerefOf (Index (Arg3, Zero)), Zero))
                                {
                                    Store (Zero, MOR)
                                    Return (Zero)
                                }

                                If (LEqual (DerefOf (Index (Arg3, Zero)), One))
                                {
                                    Store (One, MOR)
                                    Return (Zero)
                                }
                            }

                            Return (One)
                        }

                        Return (Buffer (One)
                        {
                            0x00
                        })
                    }
                }

                Scope (\_SB)
                {
                    OperationRegion (TCG1, SystemMemory, 0x3E6C7DB5, 0x00000007)
                    Field (TCG1, AnyAcc, NoLock, Preserve)
                    {
                        PPRQ,   8, 
                        PPLO,   8, 
                        PPRP,   8, 
                        PPOR,   8, 
                        TPRS,   8, 
                        TPMV,   8, 
                        MOR,    8
                    }

                    Method (PHSR, 1, Serialized)
                    {
                        Store (Arg0, BCMD)
                        Store (Zero, DID)
                        Store (Zero, SMIC)
                        If (LEqual (BCMD, Arg0)) {}
                        Store (Zero, BCMD)
                        Store (Zero, DID)
                        Return (Zero)
                    }

                    OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
                    Field (SMI0, AnyAcc, NoLock, Preserve)
                    {
                        SMIC,   8
                    }

                    OperationRegion (SMI1, SystemMemory, 0x3E6C9EBD, 0x00000090)
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
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F13"))
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
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (PBUF, Buffer (0x14)
                        {
                            /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                            /* 0010 */    0x00, 0x00, 0x00, 0x00
                        })
                        CreateDWordField (PBUF, Zero, PIO0)
                        CreateDWordField (PBUF, 0x04, DMA0)
                        CreateDWordField (PBUF, 0x08, PIO1)
                        CreateDWordField (PBUF, 0x0C, DMA1)
                        CreateDWordField (PBUF, 0x10, FLAG)
                        Store (GETP (PRIT), PIO0)
                        Store (GDMA (And (SYNC, One), And (ICR3, One), 
                            And (ICR0, One), SDT0, And (ICR1, One)), DMA0)
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
                            Store (PIO1, DMA1)
                        }

                        Store (GETF (And (SYNC, One), And (SYNC, 0x02), 
                            PRIT), FLAG)
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
                        CreateDWordField (Arg0, Zero, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        If (LEqual (SizeOf (Arg1), 0x0200))
                        {
                            And (PRIT, 0xC0F0, PRIT)
                            And (SYNC, 0x02, SYNC)
                            Store (Zero, SDT0)
                            And (ICR0, 0x02, ICR0)
                            And (ICR1, 0x02, ICR1)
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
                            If (And (FLAG, One))
                            {
                                Or (SYNC, One, SYNC)
                                Store (SDMA (DMA0), SDT0)
                                If (LLess (DMA0, 0x1E))
                                {
                                    Or (ICR3, One, ICR3)
                                }

                                If (LLess (DMA0, 0x3C))
                                {
                                    Or (ICR0, One, ICR0)
                                }

                                If (And (W930, 0x2000))
                                {
                                    Or (ICR1, One, ICR1)
                                }
                            }
                        }

                        If (LEqual (SizeOf (Arg2), 0x0200))
                        {
                            And (PRIT, 0xBF0F, PRIT)
                            Store (Zero, PSIT)
                            And (SYNC, One, SYNC)
                            Store (Zero, SDT1)
                            And (ICR0, One, ICR0)
                            And (ICR1, One, ICR1)
                            And (ICR3, One, ICR3)
                            And (ICR5, One, ICR5)
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
                        Name (_ADR, Zero)
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (XOr (SATD, One))
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB0, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                            })
                            CreateByteField (PIB0, One, PMD0)
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
                                Store (One, PMD0)
                            }

                            If (And (SYNC, One))
                            {
                                Store (Or (SDT0, 0x40), DMD0)
                                If (And (ICR1, One))
                                {
                                    If (And (ICR0, One))
                                    {
                                        Add (DMD0, 0x02, DMD0)
                                    }

                                    If (And (ICR3, One))
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
                        Name (_ADR, One)
                        Method (_RMV, 0, NotSerialized)
                        {
                            Return (One)
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            Store (One, ICR4)
                        }

                        Method (_STA, 0, NotSerialized)
                        {
                            If (BID0)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (PIB1, Buffer (0x0E)
                            {
                                /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF, 0x03, 
                                /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xB0, 0xEF
                            })
                            CreateByteField (PIB1, One, PMD1)
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
                                Store (One, PMD1)
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
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                            Offset (0x08), 
                    SYNC,   4, 
                            Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                            Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                            Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    PMOD,   2, 
                    SMOD,   2, 
                    ICR5,   4, 
                            Offset (0x50), 
                    MAPV,   2, 
                            Offset (0x52), 
                        ,   1, 
                    P1EN,   1, 
                    P2EN,   1, 
                        ,   6, 
                    P1PS,   1, 
                    P2PS,   1, 
                            Offset (0x54)
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

                OperationRegion (SMBI, SystemIO, 0x1C60, 0x10)
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
                        Return (Zero)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (SRXB, 1, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, One), TXSA)
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
                        Return (Zero)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (Arg2, DAT0)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (SRDB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, One), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x48, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (DAT0)
                    }

                    Return (0xFFFF)
                }

                Method (SWRW, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (Zero)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    And (Arg2, 0xFF, DAT0)
                    And (ShiftRight (Arg2, 0x08), 0xFF, DAT1)
                    Store (0x4C, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (SRDW, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (Zero, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, One), TXSA)
                    Store (Arg1, HCOM)
                    Store (0x4C, HCON)
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS)
                        Return (Or (ShiftLeft (DAT1, 0x08), DAT0))
                    }

                    Return (0xFFFFFFFF)
                }

                Method (SBLW, 4, Serialized)
                {
                    If (STRT ())
                    {
                        Return (Zero)
                    }

                    Store (Arg3, I2CE)
                    Store (0xBF, HSTS)
                    Store (Arg0, TXSA)
                    Store (Arg1, HCOM)
                    Store (SizeOf (Arg2), DAT0)
                    Store (Zero, Local1)
                    Store (DerefOf (Index (Arg2, Zero)), HBDR)
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
                            Return (Zero)
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
                        Return (One)
                    }

                    Return (Zero)
                }

                Method (SBLR, 3, Serialized)
                {
                    Name (TBUF, Buffer (0x0100) {})
                    If (STRT ())
                    {
                        Return (Zero)
                    }

                    Store (Arg2, I2CE)
                    Store (0xBF, HSTS)
                    Store (Or (Arg0, One), TXSA)
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
                        Return (Zero)
                    }

                    Store (DAT0, Index (TBUF, Zero))
                    Store (0x80, HSTS)
                    Store (One, Local1)
                    While (LLess (Local1, DerefOf (Index (TBUF, Zero))))
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
                            Return (Zero)
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

                    Return (Zero)
                }

                Method (STRT, 0, Serialized)
                {
                    Store (0xC8, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x40))
                        {
                            Decrement (Local0)
                            Sleep (One)
                            If (LEqual (Local0, Zero))
                            {
                                Return (One)
                            }
                        }
                        Else
                        {
                            Store (Zero, Local0)
                        }
                    }

                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, One))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, Zero))
                            {
                                KILL ()
                            }
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Return (One)
                }

                Method (COMP, 0, Serialized)
                {
                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x02))
                        {
                            Return (One)
                        }
                        Else
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, Zero))
                            {
                                KILL ()
                            }
                        }
                    }

                    Return (Zero)
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

