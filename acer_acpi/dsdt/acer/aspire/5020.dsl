/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20061109
 *
 * Disassembly of dsdt, Sun Apr 29 00:25:43 2007
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00005C2A (23594)
 *     Revision         0x01
 *     OEM ID           "ATI"
 *     OEM Table ID     "SB400"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 1, "ATI", "SB400", 0x06040000)
{
    Name (Z000, 0x01)
    Name (Z001, 0x02)
    Name (Z002, 0x04)
    Name (Z003, 0x08)
    Name (Z004, 0x00)
    Name (Z005, 0x0F)
    Name (Z006, 0x0D)
    Name (Z007, 0x0B)
    Name (Z008, 0x09)
    Name (\LIDF, 0x00)
    Name (LIDS, 0x01)
    Name (\ECON, 0x00)
    Name (\VDSS, 0x00)

    /*
     * ACPI 1.0 Processor name scope
     */
    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
    }

    Name (_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x04)
    {
        0x03, 
        0x03, 
        0x00, 
        0x00
    })
    Name (_S4, Package (0x04)
    {
        0x04, 
        0x04, 
        0x00, 
        0x00
    })
    Name (_S5, Package (0x04)
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    OperationRegion (\DEBG, SystemIO, 0x80, 0x01)
    Field (\DEBG, ByteAcc, NoLock, Preserve)
    {
        DBGP,   8
    }

    OperationRegion (\PMIO, SystemIO, 0x0CD6, 0x02)
    Field (\PMIO, ByteAcc, NoLock, Preserve)
    {
        PIDX,   8, 
        PDAT,   8
    }

    OperationRegion (\P01, SystemIO, 0x8001, 0x01)
    Field (\P01, ByteAcc, NoLock, Preserve)
    {
        PST1,   8
    }

    Name (HTTX, 0x00)
    Scope (\_SI)
    {

        /*
         * System status indicator
         */
        Method (_SST, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x01))
            {
                Store ("===== SST Working =====", Debug)
            }

            If (LEqual (Arg0, 0x02))
            {
                Store ("===== SST Waking =====", Debug)
            }

            If (LEqual (Arg0, 0x03))
            {
                Store ("===== SST Sleeping =====", Debug)
            }

            If (LEqual (Arg0, 0x04))
            {
                Store ("===== SST Sleeping S4 =====", Debug)
            }
        }
    }

    Scope (\_SB)
    {
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x4FEAEF04, 0x00000001)
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

        /*
         * Check if two arguments given are equal
         *
         * @arg0 - Argument 0
         * @arg1 - Argument 1
         *
         * Return: Zero (Arg0 != Arg1), One (Arg0 == Arg1)
         */
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
    /*
     * Control method that puts the device in the D0
     * device state (device fully on).
     */
    Method (_PS0, 0, NotSerialized)
    {
        Store (_PSC, Local0)
        Store (0x00, _PSC)
        If (LEqual (Local0, 0x03))
        {
            Store (0x01, \_SB.PCI0.LPC0.INF)
            While (\_SB.PCI0.LPC0.INF)
            {
                Store (0x20, \_SB.PCI0.LPC0.BCMD)
                Store (Zero, \_SB.PCI0.LPC0.SMIC)
                If (LAnd (LEqual (\_SB.PCI0.LPC0.INF, 0x01), LGreaterEqual (\_SB.OSTB, 0x04)))
                {
                    Sleep (0x01F4)
                }
            }
        }
    }

    /*
     * Control method that puts the device in the D3
     * device state (device off).
     */
    Method (_PS3, 0, NotSerialized)
    {
        Store (0x03, _PSC)
    }

    Mutex (MSMI, 0x07)
    Method (PHSR, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, \_SB.PCI0.LPC0.INF)
        Store (Arg0, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Store (\_SB.PCI0.LPC0.INF, Local0)
        Release (MSMI)
        Return (Local0)
    }

    Method (HKEY, 1, NotSerialized)
    {
        PHSR (0x8A, Arg0)
    }

    Method (LAMN, 1, NotSerialized)
    {
        If (\_SB.AMW0.WLMP)
        {
            Store (Arg0, \_SB.AMW0.WLID)
            Notify (\_SB.AMW0, 0xB0)
        }
        Else
        {
            PHSR (0x8B, Arg0)
        }
    }

    Method (RBEC, 1, NotSerialized)
    {
        Return (PHSR (0x8C, Arg0))
    }

    Method (WBEC, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg1, \_SB.PCI0.LPC0.INF1)
        Store (Arg0, \_SB.PCI0.LPC0.INF)
        Store (0x8D, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Release (MSMI)
    }

    Method (MBEC, 3, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)
        Store (Arg2, \_SB.PCI0.LPC0.INF2)
        Store (Arg1, \_SB.PCI0.LPC0.INF1)
        Store (Arg0, \_SB.PCI0.LPC0.INF)
        Store (0x8E, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Release (MSMI)
    }

    /*
     *  Byte 1 = 0x10
     *  Byte 2 = 0x96
     *  Byte 4 is the device we want to toggle
     *  Byte 5 is the device's status (0 = off, 1 = on)
     */
    Name (B2ED, Buffer (0x14)
    {
        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        /* 0010 */    0x00, 0x00, 0x00, 0x00
    })

    /*
     * Arg1 = 0x9610, Arg2 = varies (switches parts on/ off)
     */
    Method (WH15, 2, NotSerialized)
    {
        Acquire (MSMI, 0xFFFF)

        /*
         *  Create a 20 byte buffer using word fields in B2ED
         */
        CreateDWordField (Arg1, 0x00, DEAX)
        CreateDWordField (Arg1, 0x04, DEBX)
        CreateDWordField (Arg1, 0x08, DECX)
        CreateDWordField (Arg1, 0x0C, DEDX)
        Store (DEAX, \_SB.PCI0.LPC0.WNVA)
        Store (DEBX, \_SB.PCI0.LPC0.WNVB)
        Store (DECX, \_SB.PCI0.LPC0.WNVC)
        Store (DEDX, \_SB.PCI0.LPC0.WNVD)
        Store (0x8F, \_SB.PCI0.LPC0.BCMD)
        Store (Zero, \_SB.PCI0.LPC0.SMIC)
        Concatenate (\_SB.PCI0.LPC0.WNVA, \_SB.PCI0.LPC0.WNVB, Local0)
        Concatenate (\_SB.PCI0.LPC0.WNVC, \_SB.PCI0.LPC0.WNVD, Local1)
        Concatenate (Local0, Local1, B2ED)


        Store (\_SB.PCI0.LPC0.WFLG, Index (B2ED, 0x10))
        Release (MSMI)
        Return (B2ED)
    }

    /*
     * Control method used to notify the platform of 
     * impending sleep transition.
     */
    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, DBGP)
        Store (0x01, \LIDF)
        PHSR (0x86, 0x00)
        \_SB.PCI0.DOCK.DPTS (Arg0)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x01, \_SB.PCI0.LPC0.EC0.BLNK)
            PHSR (0x82, 0x00)
            Store (\_SB.PCI0.SMB.RVID, Local1)
            If (LGreaterEqual (Local1, 0x10))
            {
                Store (Zero, \_SB.PCI0.SMB.RSTU)
            }
        }

        If (LEqual (Arg0, 0x05))
        {
            PHSR (0x83, 0x00)
        }
    }

    /*
     * Control method run once awakened.
     */
    Method (_WAK, 1, NotSerialized)
    {
        Store (Arg0, DBGP)
        \_SB.PCI0.LPC0.EC0.TINI ()
        If (LEqual (Arg0, 0x03))
        {
            Store (0x61, PIDX)
            Store (PDAT, Local0)
            And (Local0, 0x80, Local0)
            PHSR (0x87, 0x00)
            If (LEqual (Local0, 0x00))
            {
                Notify (\_SB.SLPB, 0x02)
            }
        }

        \_SB.PCI0.DOCK.DWAK (Arg0)
        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81)
    }

    /*
     * Root level event handler
     */
    Scope (\_GPE)
    {
        /*
         * uses bit 0 of GP0_STS register
         */
        Method (_L06, 0, NotSerialized)
        {
        }

        /*
         * uses bit B of GP0_STS register
         */
        Method (_L0B, 0, NotSerialized)
        {
            Store (0x0B, DBGP)
            Notify (\_SB.PCI0.OHC1, 0x02)
            Notify (\_SB.PCI0.OHC2, 0x02)
        }
    }

    Scope (\_TZ)
    {
        Name (TBSE, 0x0AAC)
        Name (CRT0, 0x00)
        Name (CRT1, 0x00)
        Name (PSV0, 0x00)
        Name (PSV1, 0x00)
        ThermalZone (TZS0)
        {
            /*
             * Returns the thermal zone's current temperature 
             * in tenths of degrees.
             */
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPC0.EC0.THS0, Local0)
                }
                Else
                {
                    Store (RBEC (0xA8), Local0)
                }

                If (LLessEqual (Local0, PSV0))
                {
                    If (\ECON)
                    {
                        Store (\_SB.PCI0.LPC0.EC0.KCSS, Local1)
                    }
                    Else
                    {
                        And (RBEC (0x92), 0x01, Local1)
                    }

                    If (Local1)
                    {
                        Add (PSV0, 0x02, Local0)
                    }
                }

                Return (C2K (Local0))
            }

            /*
             * Thermal zone object that returns critical trip 
             * point in tenths of degrees Kelvin.
             */
            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x00, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TS5H, Local0)
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

            /*
             * List of processor device objects for clock throttling.
             */
            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })

            /*
             * Returns the passive cooling policy threshold value 
             * in tenths of degrees.
             */
            Method (_PSV, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x00, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TS3H, Local0)
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
            /*
             * Returns the thermal zone's current temperature 
             * in tenths of degrees.
             */
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPC0.EC0.THS1, Local0)
                }
                Else
                {
                    Store (RBEC (0xA9), Local0)
                }

                If (LLessEqual (Local0, PSV1))
                {
                    If (\ECON)
                    {
                        Store (\_SB.PCI0.LPC0.EC0.KCSS, Local1)
                    }
                    Else
                    {
                        And (RBEC (0x92), 0x01, Local1)
                    }

                    If (Local1)
                    {
                        Add (PSV1, 0x02, Local0)
                    }
                }

                Return (C2K (Local0))
            }

            /*
             * Thermal zone object that returns critical trip 
             * point in tenths of degrees Kelvin.
             */
            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x01, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TS5H, Local0)
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

            /*
             * List of processor device objects for clock throttling.
             */
            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })

            /*
             * Returns the passive cooling policy threshold value 
             * in tenths of degrees.
             */
            Method (_PSV, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x01, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TS3H, Local0)
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

        ThermalZone (TZSV)
        {
            Name (PSVV, 0x00)

            /*
             * Returns the thermal zone's current temperature 
             * in tenths of degrees.
             */
            Method (_TMP, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPC0.EC0.THS2, Local0)
                }
                Else
                {
                    Store (RBEC (0xAA), Local0)
                }

                If (LLessEqual (Local0, PSVV))
                {
                    If (\ECON)
                    {
                        Store (\_SB.PCI0.LPC0.EC0.KVTP, Local1)
                    }
                    Else
                    {
                        And (RBEC (0x92), 0x10, Local1)
                    }

                    If (Local1)
                    {
                        Add (PSVV, 0x02, Local0)
                    }
                }

                Return (C2K (Local0))
            }

            /*
             * Thermal zone object that returns critical trip 
             * point in tenths of degrees Kelvin.
             */
            Method (_CRT, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x02, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TS5H, Local0)
                }
                Else
                {
                    WBEC (0x01, 0x02)
                    Store (RBEC (0xDE), Local0)
                }

                If (LGreaterEqual (Local0, 0x80))
                {
                    Store (0x64, Local0)
                }

                Return (C2K (Local0))
            }

            /*
             * List of processor device objects for clock throttling.
             */
            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })

            /*
             * Returns the passive cooling policy threshold value 
             * in tenths of degrees.
             */
            Method (_PSV, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (0x00, \_SB.PCI0.LPC0.EC0.TIID)
                    Store (\_SB.PCI0.LPC0.EC0.TS3H, Local0)
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

                Store (Local0, PSVV)
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
                Store (0x1E, Local0)
            }

            If (LGreaterEqual (Local0, 0x78))
            {
                Store (0x1E, Local0)
            }

            Add (Multiply (Local0, 0x0A), TBSE, Local0)
            Return (Local0)
        }
    }

    Name (\GPIC, 0x00)
    /*
     * Report to the BIOS the current interrupt 
     * model used by the OS.
     */
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
        If (Arg0)
        {
            \_SB.PCI0.LPC0.DSPI ()
        }
    }

    Scope (\_SB)
    {
        /*
         *  ACPI Lid Device
         */
        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D"))

            /*
             * Object that returns the status of the 
             * Lid on a mobile system.
             */
            Method (_LID, 0, NotSerialized)
            {
                If (\ECON)
                {
                    Store (\_SB.PCI0.LPC0.EC0.KLID, Local0)
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

            /*
             * Power management control method that enables 
             * or disables the device's wake function.
             */
            Method (_PSW, 1, NotSerialized)
            {
                If (\ECON)
                {
                    Store (Arg0, \_SB.PCI0.LPC0.EC0.LIDW)
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

            /*
             * Power management object that evaluates to the 
             * device's power requirements in order to wake 
             * the system from a system sleeping state.
             */
            Name (_PRW, Package (0x02)
            {
                0x06, 
                0x03
            })
        }

        /*
         *  ACPI Sleep Button
         */
        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            /*
             * Power management object that evaluates to the 
             * device's power requirements in order to wake 
             * the system from a system sleeping state.
             */
            Name (_PRW, Package (0x02)
            {
                0x06, 
                0x03
            })
        }

        /*
         * Windows Management Interface device
         *
         * http://www.microsoft.com/whdc/system/pnppwr/wmi/wmi-acpi.mspx
         */
        Device (AMW0)
        {
            Name (_HID, "*pnp0c14")
            Name (_UID, 0x00)
            Name (WLID, 0x00)
            Name (WLMP, 0x00)

            /*
             * Data Block
             */
            Name (_WDG, Buffer (0x3C)
            {
                0x81, 0x17, 0xF4, 0xD9, 0x33, 0xF6, 0x00, 0x44, 
                0x93, 0x55, 0x60, 0x17, 0x70, 0xBE, 0xC5, 0x10, 
                0x41, 0x41, // Object ID (AA)
                0x01,       // Instance Count
                0x00,       // Flags ()

                0x1D, 0x37, 0xC3, 0x67, 0xA3, 0x95, 0x37, 0x4C, 
                0xBB, 0x61, 0xDD, 0x47, 0xB4, 0x91, 0xDA, 0xAB, 
                0x41, 0x42, // Object ID (AB)
                0x01,       // Instance Count
                0x02,       // Flags (WMIACPI_REGFLAG_METHOD)
 
                0x71, 0xBF, 0xD1, 0x40, 0x2D, 0xA8, 0x59, 0x4E, 
                0xA1, 0x68, 0x39, 0x85, 0xE0, 0x3B, 0x2E, 0x87, 
                0xB0, 0x00, // Notification ID
                0x01,       // Instance Count 
                0x08        // Flags (WMIACPI_REGFLAG_EVENT)
            })

            /*
             *  Storage for data block AB
             */
            Name (B0ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })

            /*
             *  Storage for data block AA
             */
            Name (B1ED, Buffer (0x04)
            {
                0x00, 0x00, 0x00, 0x00
            })

            /*
             *  _WED is called in response to an event launching ("firing") to gain additional 
             *  information about the event. Arg0 has the NotifyId for the event launched.
             *  -> There is only one possible event here, 0xB0, to retrieve block AB
             *  -> Called by LAMN's Notify()
             */
            Method (_WED, 1, NotSerialized)
            {
                /*
                 *  DBGP = Debug Port Table, part of Microsoft Debug Port Specification
                 *  Ref Googling -> Just another name for a serial port...
                 *  We can safely ignore these - they are all irrelevant!
                 *  All they same to do is log which object we are calling...
                 */
                Store (0xB0, DBGP)
                If (LEqual (Arg0, 0xB0))
                {
                    Store (WLID, B0ED)
                    Return (B0ED)
                }
            }

            /*
             *  Data block query for AA
             */
            Method (WQAA, 1, NotSerialized)
            {
                Store (0xAA, DBGP)
                Return (B1ED)
            }

            /*
             *  Data block set for AA
             */
            Method (WSAA, 2, NotSerialized)
            {
                Store (0xA1, DBGP)
                CreateDWordField (Arg1, 0x00, DDD0)
                If (LEqual (DDD0, 0x01))
                {
                    Add (DDD0, 0x02, DDD0)
                    Store (DDD0, Index (B1ED, 0x00))
                }
            }

            /*
             *  Method execution for object AB
             */
            Method (WMAB, 3, NotSerialized)
            {
                Store (0xAB, DBGP)
                Store (0x01, WLMP)
                Return (WH15 (Arg1, Arg2))
            }
        }

        /*
         *  PCI Bus
         */
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_UID, 0x01)
            Name (_BBN, 0x00)

            /*
             * Device initialization method that is run 
             * shortly after ACPI has been enabled.
             */
            Method (_INI, 0, NotSerialized)
            {
                \_SB.OSTP ()
            }

            OperationRegion (K8ST, SystemMemory, 0x4FEAEF74, 0x00000048)
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
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C2000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C6000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000C9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CA000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CE000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D2000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D6000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000D9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DA000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DE000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y10, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E2000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y11, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y12, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E6000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y13, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000E9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y14, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EA000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y15, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y16, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EE000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y17, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y18, AddressRangeMemory, TypeStatic)
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
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    0x00,, , TypeStatic)
            })

            /*
             * Device configuration object that specifies
             * a device's current resource settings, or a
             * control method that generates such an object.
             */
            Method (_CRS, 0, Serialized)
            {
                CreateBitField (RSRC, \_SB.PCI0._Y00._RW, C0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y00._LEN, C0LN)
                Store (One, C0RW)
                Store (0x2000, C0LN)
                If (And (C0_0, 0x1818))
                {
                    Store (0x00, C0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y01._RW, C2RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y01._LEN, C2LN)
                Store (One, C2RW)
                Store (0x2000, C2LN)
                If (And (C2_0, 0x1818))
                {
                    Store (0x00, C2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y02._RW, C4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y02._LEN, C4LN)
                Store (One, C4RW)
                Store (0x2000, C4LN)
                If (And (C4_0, 0x1818))
                {
                    Store (0x00, C4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y03._RW, C6RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y03._LEN, C6LN)
                Store (One, C6RW)
                Store (0x2000, C6LN)
                If (And (C6_0, 0x1818))
                {
                    Store (0x00, C6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y04._RW, C8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y04._LEN, C8LN)
                Store (One, C8RW)
                Store (0x2000, C8LN)
                If (And (C8_0, 0x1818))
                {
                    Store (0x00, C8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y05._RW, CARW)
                CreateDWordField (RSRC, \_SB.PCI0._Y05._LEN, CALN)
                Store (One, CARW)
                Store (0x2000, CALN)
                If (And (CA_0, 0x1818))
                {
                    Store (0x00, CALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y06._RW, CCRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y06._LEN, CCLN)
                Store (One, CCRW)
                Store (0x2000, CCLN)
                If (And (CC_0, 0x1818))
                {
                    Store (0x00, CCLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y07._RW, CERW)
                CreateDWordField (RSRC, \_SB.PCI0._Y07._LEN, CELN)
                Store (One, CERW)
                Store (0x2000, CELN)
                If (And (CE_0, 0x1818))
                {
                    Store (0x00, CELN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y08._RW, D0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y08._LEN, D0LN)
                Store (One, D0RW)
                Store (0x2000, D0LN)
                If (And (D0_0, 0x1818))
                {
                    Store (0x00, D0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y09._RW, D2RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y09._LEN, D2LN)
                Store (One, D2RW)
                Store (0x2000, D2LN)
                If (And (D2_0, 0x1818))
                {
                    Store (0x00, D2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0A._RW, D4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0A._LEN, D4LN)
                Store (One, D4RW)
                Store (0x2000, D4LN)
                If (And (D4_0, 0x1818))
                {
                    Store (0x00, D4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0B._RW, D6RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0B._LEN, D6LN)
                Store (One, D6RW)
                Store (0x2000, D6LN)
                If (And (D6_0, 0x1818))
                {
                    Store (0x00, D6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0C._RW, D8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0C._LEN, D8LN)
                Store (One, D8RW)
                Store (0x2000, D8LN)
                If (And (D8_0, 0x1818))
                {
                    Store (0x00, D8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0D._RW, DARW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0D._LEN, DALN)
                Store (One, DARW)
                Store (0x2000, DALN)
                If (And (DA_0, 0x1818))
                {
                    Store (0x00, DALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0E._RW, DCRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0E._LEN, DCLN)
                Store (One, DCRW)
                Store (0x2000, DCLN)
                If (And (DC_0, 0x1818))
                {
                    Store (0x00, DCLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0F._RW, DERW)
                CreateDWordField (RSRC, \_SB.PCI0._Y0F._LEN, DELN)
                Store (One, DERW)
                Store (0x2000, DELN)
                If (And (DE_0, 0x1818))
                {
                    Store (0x00, DELN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y10._RW, E0RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y10._LEN, E0LN)
                Store (One, E0RW)
                Store (0x2000, E0LN)
                If (And (E0_0, 0x1818))
                {
                    Store (0x00, E0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y11._RW, E2RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y11._LEN, E2LN)
                Store (One, E2RW)
                Store (0x2000, E2LN)
                If (And (E2_0, 0x1818))
                {
                    Store (0x00, E2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y12._RW, E4RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y12._LEN, E4LN)
                Store (One, E4RW)
                Store (0x2000, E4LN)
                If (And (E4_0, 0x1818))
                {
                    Store (0x00, E4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y13._RW, E6RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y13._LEN, E6LN)
                Store (One, E6RW)
                Store (0x2000, E6LN)
                If (And (E6_0, 0x1818))
                {
                    Store (0x00, E6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y14._RW, E8RW)
                CreateDWordField (RSRC, \_SB.PCI0._Y14._LEN, E8LN)
                Store (One, E8RW)
                Store (0x2000, E8LN)
                If (And (E8_0, 0x1818))
                {
                    Store (0x00, E8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y15._RW, EARW)
                CreateDWordField (RSRC, \_SB.PCI0._Y15._LEN, EALN)
                Store (One, EARW)
                Store (0x2000, EALN)
                If (And (EA_0, 0x1818))
                {
                    Store (0x00, EALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y16._RW, ECRW)
                CreateDWordField (RSRC, \_SB.PCI0._Y16._LEN, ECLN)
                Store (One, ECRW)
                Store (0x2000, ECLN)
                If (And (EC_0, 0x1818))
                {
                    Store (0x00, ECLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._Y17._RW, EERW)
                CreateDWordField (RSRC, \_SB.PCI0._Y17._LEN, EELN)
                Store (One, EERW)
                Store (0x2000, EELN)
                If (And (EE_0, 0x1818))
                {
                    Store (0x00, EELN)
                }

                CreateDWordField (RSRC, \_SB.PCI0._Y18._MIN, BTMN)
                CreateDWordField (RSRC, \_SB.PCI0._Y18._LEN, BTLN)
                Store (TOML, BTMN)
                Add (Not (BTMN), 0x01, BTLN)
                Return (RSRC)
            }

            /*
             *  General ID for reserving resources required by Plug 
             *  and Play motherboard registers. (Not specific to a 
             *  particular device.)
             */
            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y19)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y1A)
                })

                /*
                 * Device configuration object that specifies
                 * a device's current resource settings, or a
                 * control method that generates such an object.
                 */
                Method (_CRS, 0, NotSerialized)
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y19._BAS, MB01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y19._LEN, ML01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._BAS, MB02)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._LEN, ML02)
                    If (GPIC)
                    {
                        Store (0xFEC00000, MB01)
                        Store (0xFEE00000, MB02)
                        Store (0x1000, ML01)
                        Store (0x1000, ML02)
                    }

                    Return (MEM1)
                }
            }

            /*
             * Object that specifies the PCI interrupt routing table.
             */
            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x05)
                    {
                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }
                    })
                }
                Else
                {
                    Return (Package (0x05)
                    {
                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }
                    })
                }
            }

            OperationRegion (BAR1, PCI_Config, 0x14, 0x04)
            Field (BAR1, ByteAcc, NoLock, Preserve)
            {
                Z009,   32
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00130000)

                /*
                 * Power management object that evaluates to the 
                 * device's power requirements in order to wake 
                 * the system from a system sleeping state.
                 */
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })

                /*
                 * Power management control method that enables 
                 * or disables the device's wake function.
                 */
                Method (_PSW, 1, NotSerialized)
                {
                }
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130001)

                /*
                 * Power management object that evaluates to the 
                 * device's power requirements in order to wake 
                 * the system from a system sleeping state.
                 */
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })

                /*
                 * Power management control method that enables 
                 * or disables the device's wake function.
                 */
                Method (_PSW, 1, NotSerialized)
                {
                }
            }

            Device (EHCI)
            {
                Name (_ADR, 0x00130002)

                /*
                 * Power management object that evaluates to the 
                 * device's power requirements in order to wake 
                 * the system from a system sleeping state.
                 */
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })

                /*
                 * Power management control method that enables 
                 * or disables the device's wake function.
                 */
                Method (_PSW, 1, NotSerialized)
                {
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (Z00A, PCI_Config, 0x08, 0x01)
                Field (Z00A, ByteAcc, NoLock, Preserve)
                {
                    RVID,   8
                }

                OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    INPM,   8, 
                    DAPM,   8
                }

                IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
                {
                        ,   1, 
                    TM1E,   1, 
                    TM2E,   1, 
                            Offset (0x01), 
                        ,   1, 
                    TM1S,   1, 
                    TM2S,   1, 
                            Offset (0x04), 
                        ,   7, 
                    SLPS,   1, 
                            Offset (0x1C), 
                        ,   3, 
                    MKME,   1, 
                    PI3E,   1, 
                    PI2E,   1, 
                    PI1E,   1, 
                    PI0E,   1, 
                        ,   3, 
                    MKMS,   1, 
                    PI3S,   1, 
                    PI2S,   1, 
                    PI1S,   1, 
                    PI0S,   1, 
                            Offset (0x36), 
                        ,   6, 
                    GVT6,   1, 
                            Offset (0x37), 
                        ,   4, 
                    GPX1,   1, 
                        ,   1, 
                    GPX3,   1, 
                            Offset (0x38), 
                        ,   1, 
                    GPX4,   1, 
                    GPX5,   1, 
                        ,   1, 
                    GPX6,   1, 
                            Offset (0x55), 
                    SPRE,   1, 
                            Offset (0x65), 
                        ,   5, 
                    RSTU,   1, 
                            Offset (0x68), 
                        ,   3, 
                    TPDE,   1, 
                        ,   1
                }

                Method (TRMD, 0, NotSerialized)
                {
                    Store (Zero, SPRE)
                    Store (Zero, TPDE)
                }

                Method (HTCD, 0, NotSerialized)
                {
                    Store (Zero, PI2E)
                    Store (Zero, TM2E)
                    Store (PI2S, PI2S)
                    Store (TM2S, TM2S)
                }
            }

            Device (IDE)
            {
                Name (_ADR, 0x00140001)
                Name (UDMT, Package (0x08)
                {
                    0x78, 
                    0x5A, 
                    0x3C, 
                    0x2D, 
                    0x1E, 
                    0x14, 
                    0x0F, 
                    0x00
                })
                Name (PIOT, Package (0x06)
                {
                    0x0258, 
                    0x0186, 
                    0x010E, 
                    0xB4, 
                    0x78, 
                    0x00
                })
                Name (PITR, Package (0x06)
                {
                    0x99, 
                    0x47, 
                    0x34, 
                    0x22, 
                    0x20, 
                    0x99
                })
                Name (MDMT, Package (0x04)
                {
                    0x01E0, 
                    0x96, 
                    0x78, 
                    0x00
                })
                Name (MDTR, Package (0x04)
                {
                    0x77, 
                    0x21, 
                    0x20, 
                    0xFF
                })
                OperationRegion (IDE, PCI_Config, 0x40, 0x20)
                Field (IDE, WordAcc, NoLock, Preserve)
                {
                    PPIT,   16, 
                    SPIT,   16, 
                    PMDT,   16, 
                    SMDT,   16, 
                    PPIC,   8, 
                    SPIC,   8, 
                    PPIM,   8, 
                    SPIM,   8, 
                            Offset (0x14), 
                    PUDC,   2, 
                    SUDC,   2, 
                            Offset (0x16), 
                    PUDM,   8, 
                    SUDM,   8
                }

                Method (ATPI, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    And (Local0, 0xFF, Local0)
                    Or (Local0, 0x41544900, Local0)
                    Store (Local0, \_SB.PCI0.LPC0.INFO)
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, 0x01), Add (Local1, 
                        0x01))))
                }

                /*
                 * IDE device control method to get the IDE 
                 * controller timing information.
                 * 
                 * Generic _GTM method
                 */
                Method (GTM, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x00, PIT1)
                    CreateByteField (Arg0, 0x01, PIT0)
                    CreateByteField (Arg0, 0x02, MDT1)
                    CreateByteField (Arg0, 0x03, MDT0)
                    CreateByteField (Arg0, 0x04, PICX)
                    CreateByteField (Arg0, 0x05, UDCX)
                    CreateByteField (Arg0, 0x06, UDMX)
                    Name (BUF, Buffer (0x14)
                    {
                        /* 0000 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (BUF, 0x00, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If (And (PICX, 0x01))
                    {
                        Return (BUF)
                    }

                    Store (GETT (PIT0), PIO0)
                    Store (GETT (PIT1), PIO1)
                    If (And (UDCX, 0x01))
                    {
                        Or (FLAG, 0x01, FLAG)
                        Store (DerefOf (Index (^UDMT, And (UDMX, 0x0F))), DMA0)
                    }
                    Else
                    {
                        Store (GETT (MDT0), DMA0)
                    }

                    If (And (UDCX, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (DerefOf (Index (^UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                    }
                    Else
                    {
                        Store (GETT (MDT1), DMA1)
                    }

                    Or (FLAG, 0x1A, FLAG)
                    Return (BUF)
                }

                /*
                 * IDE device control method to set the IDE 
                 * controller transfer timings.
                 *
                 * Generic _STM method
                 */
                Method (STM, 3, NotSerialized)
                {
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Name (BUF, Buffer (0x07)
                    {
                        0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUF, 0x00, PIT1)
                    CreateByteField (BUF, 0x01, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Store (Match (^PIOT, MLE, PIO0, MTR, 0x00, 0x00), Local0)
                    Divide (Local0, 0x05, Local0)
                    Store (Match (^PIOT, MLE, PIO1, MTR, 0x00, 0x00), Local1)
                    Divide (Local1, 0x05, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), PIMX)
                    Store (DerefOf (Index (^PITR, Local0)), PIT0)
                    Store (DerefOf (Index (^PITR, Local1)), PIT1)
                    If (And (FLAG, 0x01))
                    {
                        Store (Match (^UDMT, MLE, DMA0, MTR, 0x00, 0x00), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, 0x01, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (Match (^MDMT, MLE, DMA0, MTR, 0x00, 0x00), Local0)
                            Store (DerefOf (Index (^MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (^UDMT, MLE, DMA1, MTR, 0x00, 0x00), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (Match (^MDMT, MLE, DMA1, MTR, 0x00, 0x00), Local0)
                            Store (DerefOf (Index (^MDTR, Local0)), MDT1)
                        }
                    }

                    Return (BUF)
                }


                /*
                 * IDE device control method to get the Advanced Technology
                 * Attachment (ATA) task file needed to re-initialize the 
                 * drive to boot up defaults.
                 * 
                 * Generic _GTF method
                 */
                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, 0x00, MDT1)
                    CreateByteField (Arg1, 0x01, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If (LEqual (Arg0, 0xA0))
                    {
                        Store (And (PIMX, 0x0F), Local0)
                        Store (MDT0, Local1)
                        And (UDCX, 0x01, Local2)
                        Store (And (UDMX, 0x0F), Local3)
                    }
                    Else
                    {
                        Store (ShiftRight (PIMX, 0x04), Local0)
                        Store (MDT1, Local1)
                        And (UDCX, 0x02, Local2)
                        Store (ShiftRight (UDMX, 0x04), Local3)
                    }

                    Name (BUF, Buffer (0x0E)
                    {
                        /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03, 
                        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF
                    })
                    CreateByteField (BUF, 0x01, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    Store (Arg0, CMDA)
                    Store (Arg0, CMDB)
                    Or (Local0, 0x08, PMOD)
                    If (Local2)
                    {
                        Or (Local3, 0x40, DMOD)
                    }
                    Else
                    {
                        Store (Match (^MDMT, MLE, GETT (Local1), MTR, 0x00, 0x00), Local4)
                        If (LLess (Local4, 0x03))
                        {
                            Or (0x20, Local4, DMOD)
                        }
                    }

                    Return (BUF)
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)

                    /*
                     * IDE device control method to get the IDE 
                     * controller timing information.
                     */
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (^^PPIT, VPIT)
                        Store (^^PMDT, VMDT)
                        Store (^^PPIC, VPIC)
                        Store (^^PUDC, VUDC)
                        Store (^^PUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    /*
                     * IDE device control method to set the IDE 
                     * controller transfer timings.
                     */
                    Method (_STM, 3, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, ^^PPIT)
                        Store (VMDT, ^^PMDT)
                        Store (VPIM, ^^PPIM)
                        Store (VUDC, ^^PUDC)
                        Store (VUDM, ^^PUDM)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)

                        /*
                         * IDE device control method to get the Advanced Technology
                         * Attachment (ATA) task file needed to re-initialize the
                         * drive to boot up defaults.
                         */
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^PMDT, VMDT)
                            Store (^^^PPIM, VPIM)
                            Store (^^^PUDC, VUDC)
                            Store (^^^PUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)

                        /*
                         * IDE device control method to get the Advanced Technology
                         * Attachment (ATA) task file needed to re-initialize the
                         * drive to boot up defaults.
                         */
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^PMDT, VMDT)
                            Store (^^^PPIM, VPIM)
                            Store (^^^PUDC, VUDC)
                            Store (^^^PUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        And (PPIC, 0x01, Local0)
                        If (LAnd (Local0, 0x01))
                        {
                            Return (Z006)
                        }
                        Else
                        {
                            Return (Z005)
                        }
                    }

                    Name (FWSO, "FWSO")
                    Name (_PSC, 0x00)

                    /*
                     * Control method that puts the device in the D0
                     * device state (device fully on).
                     */
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (_PSC, Local0)
                        Store (0x00, _PSC)
                        If (LEqual (Local0, 0x03))
                        {
                            Store (0x01, \_SB.PCI0.LPC0.INF)
                            While (\_SB.PCI0.LPC0.INF)
                            {
                                Store (0x20, \_SB.PCI0.LPC0.BCMD)
                                Store (Zero, \_SB.PCI0.LPC0.SMIC)
                                If (LAnd (LEqual (\_SB.PCI0.LPC0.INF, 0x01), LGreaterEqual (\_SB.OSTB, 0x04)))
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
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)

                    /*
                     * IDE device control method to get the IDE
                     * controller timing information.
                     */
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (^^SPIT, VPIT)
                        Store (^^SMDT, VMDT)
                        Store (^^SPIC, VPIC)
                        Store (^^SUDC, VUDC)
                        Store (^^SUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    /*
                     * IDE device control method to set the IDE 
                     * controller transfer timings.
                     */
                    Method (_STM, 3, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, ^^SPIT)
                        Store (VMDT, ^^SMDT)
                        Store (VPIM, ^^SPIM)
                        Store (VUDC, ^^SUDC)
                        Store (VUDM, ^^SUDM)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)

                        /*
                         * IDE device control method to get the Advanced Technology
                         * Attachment (ATA) task file needed to re-initialize the
                         * drive to boot up defaults.
                         */
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^SMDT, VMDT)
                            Store (^^^SPIM, VPIM)
                            Store (^^^SUDC, VUDC)
                            Store (^^^SUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, 0x01)

                        /*
                         * IDE device control method to get the Advanced Technology
                         * Attachment (ATA) task file needed to re-initialize the
                         * drive to boot up defaults.
                         */
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^SMDT, VMDT)
                            Store (^^^SPIM, VPIM)
                            Store (^^^SUDC, VUDC)
                            Store (^^^SUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        And (SPIC, 0x01, Local0)
                        If (LAnd (Local0, 0x01))
                        {
                            Return (Z006)
                        }
                        Else
                        {
                            Return (Z005)
                        }
                    }
                }
            }

            /*
             *  Low Pin Count (LPC) Bus
             */
            Device (LPC0)
            {
                Name (_ADR, 0x00140003)
                OperationRegion (LPC0, PCI_Config, 0x00, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x44), 
                    LC44,   8, 
                    LC45,   8
                }

                Mutex (PSMX, 0x00)
                OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
                Field (PIRQ, ByteAcc, NoLock, Preserve)
                {
                    PIID,   8, 
                    PIDA,   8
                }

                IndexField (PIID, PIDA, ByteAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    PIRS,   8, 
                    PIR5,   8, 
                    PIR6,   8, 
                    PIR7,   8, 
                    PIR8,   8, 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                Name (IPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,11}
                })
                Method (DSPI, 0, NotSerialized)
                {
                    Store (0x00, PIRA)
                    Store (0x00, PIRB)
                    Store (0x00, PIRC)
                    Store (0x00, PIRD)
                    Store (0x00, PIRS)
                    Store (0x00, PIR5)
                    Store (0x00, PIR6)
                    Store (0x00, PIR7)
                    Store (0x00, PIR8)
                    Store (0x00, PIRE)
                    Store (0x00, PIRF)
                    Store (0x00, PIRG)
                    Store (0x00, PIRH)
                }

                /*
                 *  PCI interrupt link device (A)
                 */
                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRA)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRA)
                    }

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRA, IRQ0)
                        Return (Local0)
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRA)
                    }
                }

                /*
                 *  PCI interrupt link device (B)
                 */
                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRB)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRB)
                    }

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRB, IRQ0)
                        Return (Local0)
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRB)
                    }
                }

                /*
                 *  PCI interrupt link device (C)
                 */
                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRC)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRC)
                    }

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRC, IRQ0)
                        Return (Local0)
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRC)
                    }
                }

                /*
                 *  PCI interrupt link device (D)
                 */
                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRD)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRD)
                    }

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRD, IRQ0)
                        Return (Local0)
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRD)
                    }
                }

                /*
                 *  PCI interrupt link device (E)
                 */
                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRD)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRE)
                    }

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRE, IRQ0)
                        Return (Local0)
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRE)
                    }
                }

                /*
                 *  PCI interrupt link device (F)
                 */
                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRF)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRF)
                    }

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRF, IRQ0)
                        Return (Local0)
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRF)
                    }
                }

                /*
                 *  PCI interrupt link device (G)
                 */
                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRG)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRG)
                    }

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRG, IRQ0)
                        Return (Local0)
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRG)
                    }
                }

                /*
                 *  PCI interrupt link device (H)
                 */
                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRH)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRH)
                    }

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRH, IRQ0)
                        Return (Local0)
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRH)
                    }
                }

                OperationRegion (LPCR, PCI_Config, 0x44, 0x02)
                Field (LPCR, ByteAcc, NoLock, Preserve)
                {
                    CMA0,   1, 
                    CMA1,   1, 
                    CMA2,   1, 
                    CMA3,   1, 
                    CMA4,   1, 
                    CMA5,   1, 
                    CMA6,   1, 
                    CMA7,   1, 
                    CMB0,   1, 
                    CMB1,   1, 
                    CMB2,   1, 
                    CMB3,   1, 
                    CMB4,   1, 
                    CMB5,   1, 
                    CMB6,   1, 
                    CMB7,   1
                }

                /*
                 *  AT DMA Controller
                 */
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
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
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

                /*
                 *  Math Coprocessor
                 */
                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {13}
                    })
                }

                /*
                 *  AT Interrupt Controller
                 */
                Device (PIC)
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
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {2}
                    })
                }

               /*
                *  AT Real-Time Clock
                */
                Device (RTC)
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

                /*
                 *  AT-style speaker sound
                 */
                Device (SPKR)
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

                /*
                 *  AT Timer
                 */
                Device (TIME)
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
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {0}
                    })
                }

                /*
                 *  IBM Enhanced (101/102-key, PS/2 mouse support)
                 */
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

                /*
                 *  Synaptics PS/2 Port TouchPad
                 */
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

               /*
                *  General ID for reserving resources required by Plug 
                *  and Play motherboard registers. (Not specific to a 
                *  particular device.)
                */
                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x1080,             // Range Minimum
                            0x1080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
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
                            0x1200,             // Range Minimum
                            0x1200,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x040B,             // Range Minimum
                            0x040B,             // Range Maximum
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
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD4,             // Range Minimum
                            0x0CD4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD6,             // Range Minimum
                            0x0CD6,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD8,             // Range Minimum
                            0x0CD8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x8000,             // Range Minimum
                            0x8000,             // Range Maximum
                            0x01,               // Alignment
                            0x60,               // Length
                            )
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8100,             // Range Minimum
                            0x81FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8200,             // Range Minimum
                            0x82FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                        IO (Decode16,
                            0x0F40,             // Range Minimum
                            0x0F40,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x087F,             // Range Minimum
                            0x087F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                /*
                 *  System Board
                 */
                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFF80000,         // Address Base
                            0x00080000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y1B)
                    })

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (TPOS, 0x04))
                        {
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1B._BAS, BARX)
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1B._LEN, GALN)
                            Store (0x1000, GALN)
                            Store (\_SB.PCI0.Z009, Local0)
                            And (Local0, 0xFFFFFFF0, BARX)
                        }

                        Return (MSRC)
                    }

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                OperationRegion (SMI0, SystemIO, 0x00000F40, 0x00000002)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x4FEAEDE4, 0x00000120)
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
                    INF,    8, 
                    INF1,   8, 
                    INF2,   8
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            AccessAs (ByteAcc, 0x00), 
                            Offset (0x05), 
                    WNVA,   32, 
                    WNVB,   32, 
                    WNVC,   32, 
                    WNVD,   32, 
                    WFLG,   32
                }

                /*
                 *  ACPI Embedded Controller
                 */
                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x03)

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
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


                    /*
                     * Notifies AML code of a change in the 
                     * availability of an operation region.
                     */
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECON)
                            TINI ()
                        }
                    }

                    Method (TINI, 0, NotSerialized)
                    {
                        Store (0x00, KTAF)
                        Store (0x01, KTEE)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q16, 0, NotSerialized)
                    {
                        Store (0x16, DBGP)
                        LAMN (0x01)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q24, 0, NotSerialized)
                    {
                        Store (0x24, DBGP)
                        LAMN (0x6A)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q25, 0, NotSerialized)
                    {
                        Store (0x25, DBGP)
                        LAMN (0x03)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q17, 0, NotSerialized)
                    {
                        Store (0x17, DBGP)
                        Notify (\_SB.SLPB, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q19, 0, NotSerialized)
                    {
                        Store (0x19, DBGP)
                        LAMN (0x05)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q80, 0, NotSerialized)
                    {
                        Store (0x80, DBGP)
                        Store (0x02, \VDSS)
                        VGAN ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q81, 0, NotSerialized)
                    {
                        Store (0x81, DBGP)
                        Store (0x01, \VDSS)
                        VGAN ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q82, 0, NotSerialized)
                    {
                        Store (0x82, DBGP)
                        Store (0x03, \VDSS)
                        VGAN ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q83, 0, NotSerialized)
                    {
                        Store (0x83, DBGP)
                        Store (0x06, \VDSS)
                        VGAN ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q84, 0, NotSerialized)
                    {
                        Store (0x84, DBGP)
                        Store (0x04, \VDSS)
                        VGAN ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q85, 0, NotSerialized)
                    {
                        Store (0x85, DBGP)
                        Store (0x07, \VDSS)
                        VGAN ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q86, 0, NotSerialized)
                    {
                        Store (0x86, DBGP)
                        Store (0x05, \VDSS)
                        VGAN ()
                    }

                    Method (VGAN, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.EXP1.VGA, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0x10, DBGP)
                        LAMN (0x30)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x11, DBGP)
                        LAMN (0x36)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x12, DBGP)
                        LAMN (0x31)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q13, 0, NotSerialized)
                    {
                        Store (0x13, DBGP)
                        LAMN (0x11)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (0x14, DBGP)
                        LAMN (0x12)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q15, 0, NotSerialized)
                    {
                        Store (0x15, DBGP)
                        LAMN (0x13)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q23, 0, NotSerialized)
                    {
                        Store (0x23, DBGP)
                        LAMN (0x44)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q32, 0, NotSerialized)
                    {
                        Store (0x32, DBGP)
                        HKEY (0x32)
                        Store (0x00, KCTT)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x33, DBGP)
                        Store (0x00, KCSS)
                        NTMR ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, DBGP)
                        Store (0x01, KCSS)
                        NTMR ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q35, 0, NotSerialized)
                    {
                        Store (0x35, DBGP)
                        HKEY (0x35)
                        Store (0x01, KCTT)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q36, 0, NotSerialized)
                    {
                        Store (0x36, DBGP)
                        Store (0x01, KOSD)
                        Sleep (0x01F4)
                        NTMR ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q37, 0, NotSerialized)
                    {
                        Store (0x37, DBGP)
                        Store (0x01, KVTP)
                        HKEY (0x37)
                        Notify (\_TZ.TZSV, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q38, 0, NotSerialized)
                    {
                        Store (0x38, DBGP)
                        Store (0x00, KVTP)
                        HKEY (0x38)
                        Notify (\_TZ.TZSV, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q39, 0, NotSerialized)
                    {
                        Store (0x39, DBGP)
                        Store (0x01, KPPS)
                        HKEY (0x39)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q3A, 0, NotSerialized)
                    {
                        Store (0x3A, DBGP)
                        Store (0x00, KPPS)
                        HKEY (0x3A)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q40, 0, NotSerialized)
                    {
                        Store (0x40, DBGP)
                        HKEY (0x40)
                        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q41, 0, NotSerialized)
                    {
                        Store (0x41, DBGP)
                        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x81)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q48, 0, NotSerialized)
                    {
                        Store (0x48, DBGP)
                        HKEY (0x48)
                        Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q4C, 0, NotSerialized)
                    {
                        Store (0x4C, DBGP)
                        If (B0ST)
                        {
                            Notify (\_SB.PCI0.LPC0.EC0.BAT0, 0x80)
                        }
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q50, 0, NotSerialized)
                    {
                        Store (0x50, DBGP)
                        Notify (\_SB.PCI0.LPC0.EC0.ADP1, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q51, 0, NotSerialized)
                    {
                        Store (0x51, DBGP)
                        Notify (\_SB.PCI0.LPC0.EC0.ADP1, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q52, 0, NotSerialized)
                    {
                        Notify (\_SB.LID0, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q53, 0, NotSerialized)
                    {
                        Notify (\_SB.LID0, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q56, 0, NotSerialized)
                    {
                        Store (0x56, DBGP)
                        \_SB.PCI0.DOCK.DKIN ()
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q57, 0, NotSerialized)
                    {
                        Store (0x57, DBGP)
                        \_SB.PCI0.DOCK.DKOU ()
                    }

                    Method (NTMR, 0, NotSerialized)
                    {
                        Notify (\_TZ.TZS0, 0x80)
                        Notify (\_TZ.TZS1, 0x80)
                        Notify (\_TZ.TZSV, 0x80)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q5E, 0, NotSerialized)
                    {
                        Store (0x5E, DBGP)
                        Sleep (0x012C)
                        Notify (\_SB.PCI0.PB6, 0x00)
                    }

                    /*
                     * Embedded Controller Query and 
                     * SMBus Alarm control method
                     */
                    Method (_Q5F, 0, NotSerialized)
                    {
                        Store (0x5F, DBGP)
                        Sleep (0x012C)
                        Notify (\_SB.PCI0.PB6, 0x00)
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
                            Store ("Bat 8Cell", Index (Arg1, 0x09))
                            And (Arg0, 0xF0, NBID)
                            Or (Arg0, 0x04, NBID)
                            Store (BSCH, Index (Arg1, 0x0B))
                            Store ("Acer", Index (Arg1, 0x0C))
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

                    /*
                     *  ACPI Control Method Battery
                     */
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

                        /*
                         * Return device status
                         * (WARNING: Unknown! Which status?)
                         */
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

                        /*
                         * Control Method Battery information object
                         */
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

                    /*
                     *  AC Adaptor
                     */
                    Name (ACST, 0x01)
                    Device (ADP1)
                    {
                        Name (_HID, "ACPI0003")

                        /*
                         * Power source object that returns 
                         * present power source device.
                         */
                        Method (_PSR, 0, NotSerialized)
                        {
                            If (ECON)
                            {
                                Store (KACS, Local1)
                            }
                            Else
                            {
                                ShiftRight (RBEC (0x70), 0x05, Local0)
                                And (Local0, 0x01, Local1)
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

                        /*
                         * Power source object that contains a
                         * list of devices powered by a power
                         * source.
                         */
                        Method (_PCL, 0, NotSerialized)
                        {
                            Return (\_SB)
                        }

                        /*
                         * Return device status
                         * (WARNING: Unknown! Which status?)
                         */
                        Method (_STA, 0, NotSerialized)
                        {
                            Return (0x0F)
                        }
                    }
                }

                OperationRegion (N393, SystemIO, 0x2E, 0x02)
                Field (N393, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                Mutex (MTIO, 0x00)
                Method (SETD, 1, Serialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (0x07, INDX)
                    Store (Arg0, DATA)
                    Release (MTIO)
                }

                Method (READ, 1, Serialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (Arg0, INDX)
                    Store (DATA, Local0)
                    Return (Local0)
                    Release (MTIO)
                }

                Method (WRIT, 2, Serialized)
                {
                    Acquire (MTIO, 0xFFFF)
                    Store (Arg0, INDX)
                    Store (Arg1, DATA)
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

                Device (COMB)
                {
                    Name (_UID, 0x02)
                    Name (FLAG, 0xFF)
                    Name (ISNO, 0x00)
                    Name (ISIR, 0x01)
                    Name (ISCB, 0x02)
                    Method (MODE, 0, NotSerialized)
                    {
                        If (LEqual (FLAG, 0xFF))
                        {
                            If (STAT (0x04))
                            {
                                SETD (0x02)
                                If (LEqual (READ (0x74), 0x04))
                                {
                                    Store (ISCB, FLAG)
                                }
                                Else
                                {
                                    Store (ISIR, FLAG)
                                }
                            }
                            Else
                            {
                                Store (ISNO, FLAG)
                            }
                        }

                        Return (FLAG)
                    }

                    Method (_HID, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), ISIR))
                        {
                            Return (0x0160633A)
                        }
                        Else
                        {
                            Return (0x0105D041)
                        }
                    }

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), ISNO))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            SETD (0x02)
                            If (READ (0x30))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
                            }
                        }
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        SETD (0x02)
                        WRIT (0x30, 0x00)
                        Store (0x00, BF44)
                        Store (0xC0, BF45)
                        Or (LF44, AF44, LC44)
                        Or (BF45, AF45, LC45)
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

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.COMB._Y1C._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.COMB._Y1C._MAX, MAXA)
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.COMB._Y1D._INT, INTA)
                        Store (Zero, MINA)
                        Store (Zero, MAXA)
                        Store (Zero, INTA)
                        CreateWordField (CRSB, \_SB.PCI0.LPC0.COMB._Y1E._MIN, MINB)
                        CreateWordField (CRSB, \_SB.PCI0.LPC0.COMB._Y1E._MAX, MAXB)
                        CreateWordField (CRSB, \_SB.PCI0.LPC0.COMB._Y1F._INT, INTB)
                        CreateByteField (CRSB, \_SB.PCI0.LPC0.COMB._Y20._DMA, DMAB)
                        Store (Zero, MINB)
                        Store (Zero, MAXB)
                        Store (Zero, INTB)
                        Store (Zero, DMAB)
                        SETD (0x02)
                        If (READ (0x30))
                        {
                            ShiftLeft (READ (0x60), 0x08, Local0)
                            Add (Local0, READ (0x61), Local0)
                            Store (Local0, MINA)
                            Store (Local0, MAXA)
                            Store (Local0, MINB)
                            Store (Local0, MAXB)
                            And (READ (0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, Local0)
                            }

                            Store (Local0, INTA)
                            Store (Local0, INTB)
                            Store (READ (0x74), Local0)
                            If (LNotEqual (Local0, 0x04))
                            {
                                ShiftLeft (One, Local0, DMAB)
                            }
                        }

                        If (LEqual (MODE (), ISIR))
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

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), ISIR))
                        {
                            Return (PRSB)
                        }
                        Else
                        {
                            Return (PRSA)
                        }
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LEqual (MODE (), ISIR))
                        {
                            Store (Arg0, CRSB)
                            CreateWordField (CRSB, \_SB.PCI0.LPC0.COMB._Y1E._MIN, MINB)
                            CreateWordField (CRSB, \_SB.PCI0.LPC0.COMB._Y1F._INT, INTB)
                            CreateByteField (CRSB, \_SB.PCI0.LPC0.COMB._Y20._DMA, DMAB)
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
                            CreateWordField (CRSA, \_SB.PCI0.LPC0.COMB._Y1C._MIN, MINA)
                            CreateWordField (CRSA, \_SB.PCI0.LPC0.COMB._Y1D._INT, INTA)
                            Store (0x04, Local0)
                            Store (MINA, Local1)
                            Store (INTA, Local2)
                        }

                        SETD (0x02)
                        WRIT (0x74, Local0)
                        If (LEqual (Local1, 0x03F8))
                        {
                            Store (0x40, BF44)
                            Store (0xC0, BF45)
                        }

                        If (LEqual (Local1, 0x02F8))
                        {
                            Store (0x80, BF44)
                            Store (0xC0, BF45)
                        }

                        If (LEqual (Local1, 0x03E8))
                        {
                            Store (0x00, BF44)
                            Store (0xE0, BF45)
                        }

                        If (LEqual (Local1, 0x02E8))
                        {
                            Store (0x00, BF44)
                            Store (0xC8, BF45)
                        }

                        Or (AF44, BF44, Local7)
                        Or (Local7, LF44, LC44)
                        Or (AF45, BF45, LC45)
                        ShiftRight (Local1, 0x08, Local0)
                        WRIT (0x60, Local0)
                        And (Local1, 0xFF, Local0)
                        WRIT (0x61, Local0)
                        FindSetRightBit (Local2, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        WRIT (0x70, Local0)
                        WRIT (0x30, 0x01)
                        If (LEqual (MODE (), ISIR))
                        {
                            Or (READ (0xF0), 0x80, Local0)
                            WRIT (0xF0, Local0)
                        }
                    }

                    /*
                     * Control method that puts the device in the D0
                     * device state (device fully on).
                     */
                    Method (_PS0, 0, NotSerialized)
                    {
                        SETD (0x02)
                        If (LEqual (MODE (), ISIR))
                        {
                            Or (READ (0xF0), 0x80, Local1)
                            WRIT (0xF0, Local1)
                        }

                        WRIT (0x30, 0x01)
                    }

                    /*
                     * Control method that puts the device in the D3 
                     * device state (device off).
                     */
                    Method (_PS3, 0, NotSerialized)
                    {
                        SETD (0x02)
                        WRIT (0x30, 0x00)
                    }
                }

                Name (LF44, 0x00)
                Name (AF44, 0x00)
                Name (AF45, 0xC0)
                Name (BF44, 0x80)
                Name (BF45, 0xC0)

                /*
                 *  16550A-compatible COM port
                 */
                Device (COMA)
                {
                    Name (_HID, EisaId ("PNP0501"))

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (0x01)
                        {
                            If (STAT (0x08))
                            {
                                SETD (0x03)
                                If (READ (0x30))
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
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        SETD (0x03)
                        WRIT (0x30, 0x00)
                        Store (0x00, AF44)
                        Store (0xC0, AF45)
                        Or (LF44, BF44, LC44)
                        Or (AF45, BF45, LC45)
                    }

                    Name (CRSA, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x03F8,             // Range Minimum
                            0x03F8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y21)
                        IRQNoFlags (_Y22)
                            {4}
                    })

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.COMA._Y21._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.COMA._Y21._MAX, MAXA)
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.COMA._Y22._INT, INTA)
                        Store (Zero, MINA)
                        Store (Zero, MAXA)
                        Store (Zero, INTA)
                        SETD (0x03)
                        If (READ (0x30))
                        {
                            ShiftLeft (READ (0x60), 0x08, Local0)
                            Add (Local0, READ (0x61), Local0)
                            Store (Local0, MINA)
                            Store (Local0, MAXA)
                            And (READ (0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, Local0)
                            }

                            Store (Local0, INTA)
                        }

                        Return (CRSA)
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

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (PRSA)
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        Store (Arg0, CRSA)
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.COMA._Y21._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.COMA._Y22._INT, INTA)
                        Store (MINA, Local1)
                        Store (INTA, Local2)
                        SETD (0x03)
                        If (LEqual (Local1, 0x03F8))
                        {
                            Store (0x40, AF44)
                            Store (0xC0, AF45)
                        }

                        If (LEqual (Local1, 0x02F8))
                        {
                            Store (0x80, AF44)
                            Store (0xC0, AF45)
                        }

                        If (LEqual (Local1, 0x03E8))
                        {
                            Store (0x00, AF44)
                            Store (0xE0, AF45)
                        }

                        If (LEqual (Local1, 0x02E8))
                        {
                            Store (0x00, AF44)
                            Store (0xC8, AF45)
                        }

                        Or (AF44, BF44, Local7)
                        Or (Local7, LF44, LC44)
                        Or (AF45, BF45, LC45)
                        ShiftRight (Local1, 0x08, Local0)
                        WRIT (0x60, Local0)
                        And (Local1, 0xFF, Local0)
                        WRIT (0x61, Local0)
                        FindSetRightBit (Local2, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        WRIT (0x70, Local0)
                        WRIT (0x30, 0x01)
                    }
                }

                Device (LPT)
                {
                    Name (_UID, 0x00)
                    Name (FLAG, 0xFF)
                    Name (ISNO, 0x00)
                    Name (MECP, 0x01)
                    Name (MLPT, 0x02)
                    Method (MODE, 0, NotSerialized)
                    {
                        If (LEqual (FLAG, 0xFF))
                        {
                            If (STAT (0x02))
                            {
                                SETD (0x01)
                                ShiftRight (READ (0xF0), 0x05, Local0)
                                If (LOr (LEqual (Local0, 0x04), LEqual (Local0, 0x07)))
                                {
                                    Store (MECP, FLAG)
                                }
                                Else
                                {
                                    Store (MLPT, FLAG)
                                }
                            }
                            Else
                            {
                                Store (ISNO, FLAG)
                            }
                        }

                        Return (FLAG)
                    }

                    Method (_HID, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), MECP))
                        {
                            Return (0x0104D041)
                        }
                        Else
                        {
                            Return (0x0004D041)
                        }
                    }

                    /*
                     * Return device status
                     * (WARNING: Unknown! Which status?)
                     */
                    Method (_STA, 0, NotSerialized)
                    {
                        If (0x01)
                        {
                            If (LEqual (MODE (), ISNO))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                SETD (0x01)
                                If (READ (0x30))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    /*
                     * Control method that disables a device.
                     */
                    Method (_DIS, 0, NotSerialized)
                    {
                        SETD (0x01)
                        WRIT (0x30, 0x00)
                        Store (0x00, LF44)
                        Or (AF44, BF44, LC44)
                    }

                    Name (CRSA, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y23)
                        IRQNoFlags (_Y24)
                            {}
                    })
                    Name (CRSB, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y25)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            _Y26)
                        IRQNoFlags (_Y27)
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8, _Y28)
                            {}
                    })

                    /*
                     * Device configuration object that specifies
                     * a device's current resource settings, or a
                     * control method that generates such an object.
                     */
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.LPT._Y23._MIN, MINA)
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.LPT._Y23._MAX, MAXA)
                        CreateWordField (CRSA, \_SB.PCI0.LPC0.LPT._Y24._INT, INTA)
                        CreateByteField (CRSA, \_SB.PCI0.LPC0.LPT._Y23._LEN, LENA)
                        Store (Zero, MINA)
                        Store (Zero, MAXA)
                        Store (Zero, INTA)
                        Store (Zero, LENA)
                        CreateWordField (CRSB, \_SB.PCI0.LPC0.LPT._Y25._MIN, MINB)
                        CreateWordField (CRSB, \_SB.PCI0.LPC0.LPT._Y25._MAX, MAXB)
                        CreateByteField (CRSB, \_SB.PCI0.LPC0.LPT._Y25._LEN, LENB)
                        CreateWordField (CRSB, \_SB.PCI0.LPC0.LPT._Y26._MIN, MINC)
                        CreateWordField (CRSB, \_SB.PCI0.LPC0.LPT._Y26._MAX, MAXC)
                        CreateByteField (CRSB, \_SB.PCI0.LPC0.LPT._Y26._LEN, LENC)
                        CreateWordField (CRSB, \_SB.PCI0.LPC0.LPT._Y27._INT, INTB)
                        CreateByteField (CRSB, \_SB.PCI0.LPC0.LPT._Y28._DMA, DMAB)
                        Store (Zero, MINB)
                        Store (Zero, MAXB)
                        Store (Zero, LENB)
                        Store (Zero, MINC)
                        Store (Zero, MAXC)
                        Store (Zero, LENC)
                        Store (Zero, INTB)
                        Store (Zero, DMAB)
                        SETD (0x01)
                        If (READ (0x30))
                        {
                            ShiftLeft (READ (0x60), 0x08, Local0)
                            Add (Local0, READ (0x61), Local0)
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

                            And (READ (0x70), 0x0F, Local0)
                            If (Local0)
                            {
                                ShiftLeft (One, Local0, Local0)
                            }

                            Store (Local0, INTA)
                            Store (Local0, INTB)
                            Store (READ (0x74), Local0)
                            If (LNotEqual (Local0, 0x04))
                            {
                                ShiftLeft (One, Local0, DMAB)
                            }
                        }

                        If (LEqual (MODE (), MECP))
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

                    /*
                     * An object that specifies a device's possible
                     * resource settings, or a control method that
                     * generates such an object.
                     */
                    Method (_PRS, 0, NotSerialized)
                    {
                        If (LEqual (MODE (), MECP))
                        {
                            Return (PRSB)
                        }
                        Else
                        {
                            Return (PRSA)
                        }
                    }

                    /*
                     * Device configuration control method that sets 
                     * a device's settings.
                     */
                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LEqual (MODE (), MECP))
                        {
                            Store (Arg0, CRSB)
                            CreateWordField (CRSB, \_SB.PCI0.LPC0.LPT._Y25._MIN, MINB)
                            CreateWordField (CRSB, \_SB.PCI0.LPC0.LPT._Y27._INT, INTB)
                            CreateByteField (CRSB, \_SB.PCI0.LPC0.LPT._Y28._DMA, DMAB)
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
                            CreateWordField (CRSA, \_SB.PCI0.LPC0.LPT._Y23._MIN, MINA)
                            CreateWordField (CRSA, \_SB.PCI0.LPC0.LPT._Y24._INT, INTA)
                            Store (0x04, Local0)
                            Store (MINA, Local1)
                            Store (INTA, Local2)
                        }

                        SETD (0x01)
                        WRIT (0x74, Local0)
                        If (LEqual (Local1, 0x0378))
                        {
                            Store (0x03, LF44)
                        }

                        If (LEqual (Local1, 0x0278))
                        {
                            Store (0x0C, LF44)
                        }

                        If (LEqual (Local1, 0x03BC))
                        {
                            Store (0x30, LF44)
                        }

                        Or (AF44, BF44, Local7)
                        Or (Local7, LF44, LC44)
                        ShiftRight (Local1, 0x08, Local0)
                        WRIT (0x60, Local0)
                        And (Local1, 0xFF, Local0)
                        WRIT (0x61, Local0)
                        FindSetRightBit (Local2, Local0)
                        If (Local0)
                        {
                            Decrement (Local0)
                        }

                        WRIT (0x70, Local0)
                        WRIT (0x30, 0x01)
                    }
                }
            }

            Device (PB6)
            {
                Name (_ADR, 0x00060000)

                /*
                 * Object that specifies the PCI interrupt routing table.
                 */
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
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
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
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (PB7)
            {
                Name (_ADR, 0x00070000)
                OperationRegion (P3CS, PCI_Config, 0x40, 0x0100)
                Field (P3CS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x28), 
                        ,   4, 
                    LDP3,   1
                }

                OperationRegion (PCIR, PCI_Config, 0x40, 0xC0)
                Field (PCIR, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x32), 
                        ,   6, 
                    DCKD,   1, 
                            Offset (0x33)
                }

                /*
                 * Object that specifies the PCI interrupt routing table.
                 */
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
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
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
                                0x00, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }
                        })
                    }
                }

                /*
                 *  Docking Station (may not be standard?)
                 */
                Scope (\_SB.PCI0)
                {
                    Device (DOCK)
                    {
                        Name (_HID, EisaId ("PNP0C15"))
                        Name (_UID, 0x01)
                        Name (_BDN, "EZ4 ")
                        Name (DCKS, 0x00)
                        Name (DSTS, 0x00)
                        Name (DEJT, 0x00)
                        Method (_DCK, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_EJ0, 1, NotSerialized)
                        {
                            Store (0x01, DEJT)
                            If (Arg0)
                            {
                                Store (0x00, DCKS)
                            }

                            PHSR (0x81, 0x00)
                        }

                        Method (_EJ3, 1, NotSerialized)
                        {
                        }

                        Method (_EJ4, 1, NotSerialized)
                        {
                        }

                        /*
                         * Return device status
                         * (WARNING: Unknown! Which status?)
                         */
                        Method (_STA, 0, NotSerialized)
                        {
                            If (DCKS)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (DKIN, 0, NotSerialized)
                        {
                            Store (0x00, DEJT)
                            PHSR (0x88, 0x00)
                            Sleep (0x01F4)
                            PHSR (0x80, 0x00)
                            Sleep (0x01F4)
                            Store (0x01, DCKS)
                            Notify (\_SB.PCI0.DOCK, 0x00)
                        }

                        Method (DKOU, 0, NotSerialized)
                        {
                            If (LEqual (DEJT, 0x00))
                            {
                                Notify (\_SB.PCI0.PB7.PXHA, 0x00)
                                Sleep (0x01F4)
                                PHSR (0x81, 0x00)
                                Sleep (0x01F4)
                                Store (0x00, DEJT)
                            }

                            Store (0x00, DCKS)
                            Notify (\_SB.PCI0.DOCK, 0x01)
                        }

                        Method (DPTS, 1, NotSerialized)
                        {
                            Store (DCKS, DSTS)
                        }

                        Method (DWAK, 1, NotSerialized)
                        {
                            If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
                            {
                                Store (\_SB.PCI0.LPC0.EC0.EZ4D, Local0)
                                If (LNotEqual (Local0, DSTS))
                                {
                                    If (LEqual (Local0, 0x01))
                                    {
                                        DKIN ()
                                    }
                                    Else
                                    {
                                        Notify (\_SB.PCI0.PB7.PXHA, 0x00)
                                        Sleep (0x01F4)
                                        PHSR (0x81, 0x00)
                                        Sleep (0x01F4)
                                        Store (0x00, DEJT)
                                        Store (0x00, DCKS)
                                    }
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x01))
                                    {
                                        PHSR (0x80, 0x00)
                                        Sleep (0x01F4)
                                        Store (0x00, DEJT)
                                        Store (0x01, DCKS)
                                    }
                                }
                            }
                        }
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
                    Method (_INI, 0, NotSerialized)
                    {
                        And (RBEC (0x71), 0x04, Local0)
                        If (LOr (LEqual (\_SB.PCI0.PB7.PXHA.PDID, 0x032C), LEqual (Local0, 0x04)))
                        {
                            Store (0x01, \_SB.PCI0.DOCK.DCKS)
                            Store (0x1F, DBGP)
                            PHSR (0x80, 0x00)
                            Sleep (0x01F4)
                        }
                    }

                    Name (_PSC, 0x00)

                    /*
                     * Control method that puts the device in the D0
                     * device state (device fully on).
                     */
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    /*
                     * Control method that puts the device in the D3
                     * device state (device off).
                     */
                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    /*
                     * Object that specifies the PCI interrupt routing table.
                     */
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
                                    0x13
                                }, 

                                Package (0x04)
                                {
                                    0x0002FFFF, 
                                    0x01, 
                                    0x00, 
                                    0x10
                                }, 

                                Package (0x04)
                                {
                                    0x0002FFFF, 
                                    0x02, 
                                    0x00, 
                                    0x11
                                }, 

                                Package (0x04)
                                {
                                    0x0003FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x12
                                }, 

                                Package (0x04)
                                {
                                    0x0003FFFF, 
                                    0x01, 
                                    0x00, 
                                    0x13
                                }, 

                                Package (0x04)
                                {
                                    0x0003FFFF, 
                                    0x02, 
                                    0x00, 
                                    0x10
                                }, 

                                Package (0x04)
                                {
                                    0x0004FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x11
                                }, 

                                Package (0x04)
                                {
                                    0x0005FFFF, 
                                    0x00, 
                                    0x00, 
                                    0x12
                                }, 

                                Package (0x04)
                                {
                                    0x0006FFFF, 
                                    0x00, 
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
                                    \_SB.PCI0.LPC0.LNKD, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x01, 
                                    \_SB.PCI0.LPC0.LNKA, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x02, 
                                    \_SB.PCI0.LPC0.LNKB, 
                                    0x00
                                }, 

                                Package (0x04)
                                {
                                    0xFFFF, 
                                    0x03, 
                                    \_SB.PCI0.LPC0.LNKC, 
                                    0x00
                                }
                            })
                        }
                    }

                    Method (Z00B, 0, NotSerialized)
                    {
                        Sleep (0x01F4)
                        PHSR (0x80, 0x00)
                        Notify (\_SB.PCI0.PB7, 0x00)
                        Sleep (0x01F4)
                    }
                }
            }

            Device (EXP1)
            {
                Name (_ADR, 0x00020000)
                OperationRegion (P1CS, PCI_Config, 0x40, 0xC0)
                Field (P1CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x20), 
                    RID1,   16, 
                    PSP1,   1, 
                    PPP1,   1
                }

                /*
                 * Object that specifies the PCI interrupt routing table.
                 */
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
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
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
                                0x00, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)
                    Name (SWIT, 0x01)
                    Name (CRTC, 0x01)
                    Name (LCDC, 0x01)
                    Name (TV0C, 0x00)
                    Name (DVIC, 0x01)
                    Name (CRTN, 0x01)
                    Name (LCDN, 0x01)
                    Name (TV0N, 0x00)
                    Name (DVIN, 0x01)
                    Method (VDEV, 0, NotSerialized)
                    {
                        GDST ()
                        If (LEqual (\VDSS, 0x00))
                        {
                            Store (0x00, Local0)
                            If (LEqual (CRTC, 0x01))
                            {
                                Store (0x02, Local0)
                            }

                            Increment (Local0)
                            If (LGreater (Local0, 0x04))
                            {
                                Store (0x01, Local0)
                            }

                            If (LAnd (Local0, 0x01))
                            {
                                Store (0x01, LCDN)
                            }

                            If (LAnd (Local0, 0x02))
                            {
                                Store (0x01, CRTN)
                            }

                            If (LAnd (Local0, 0x04))
                            {
                                Store (0x01, TV0N)
                            }
                        }

                        If (LEqual (\VDSS, 0x01))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x00, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x02))
                        {
                            Store (0x00, LCDN)
                            Store (0x01, CRTN)
                            Store (0x00, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x03))
                        {
                            Store (0x01, LCDN)
                            Store (0x01, CRTN)
                            Store (0x00, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x04))
                        {
                            Store (0x00, LCDN)
                            Store (0x00, CRTN)
                            Store (0x01, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x05))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x01, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x06))
                        {
                            Store (0x00, LCDN)
                            Store (0x00, CRTN)
                            Store (0x00, TV0N)
                            Store (0x01, DVIN)
                        }

                        If (LEqual (\VDSS, 0x07))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x00, TV0N)
                            Store (0x01, DVIN)
                        }
                    }

                    Method (GDST, 0, NotSerialized)
                    {
                        Store (0x00, CRTC)
                        Store (0x00, LCDC)
                        Store (0x00, TV0C)
                        Store (0x00, DVIC)
                    }

                    /*
                     * Enable/Disable output switching -
                     *
                     * Required if system supports display 
                     * switching or LCD brightness levels
                     *
                     * Bit 1: pg 571
                     * Bit 2: Toggle change brightness on AC/DC switch
                     */
                    Method (_DOS, 1, NotSerialized)
                    {
                        VDEV ()
                        Store (Arg0, Local0)
                        And (Local0, 0x01, SWIT)
                    }

                   /*
                    * Enumerate all devices attached to display adapter
                    *
                    * Required if integrated controller supports
                    * output switching
                    */
                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x04)
                        {
                            0x0100, 
                            0x0210, 
                            0x0200, 
                            0x0110
                        })
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (CRTC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        /*
                         * Query graphics state
                         *
                         * Required if the system supports display
                         * switching (via hotkey).
                         */
                        Method (_DGS, 0, NotSerialized)
                        {
                            If (CRTN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        /*
                         * Device state set (active/ inactive)
                         *
                         * Required if the system supports display
                         * switching (via hotkey).
                         */
                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (DVI)
                    {
                        Name (_ADR, 0x0210)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (DVIC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        /*
                         * Query graphics state (active/ inactive)
                         *
                         * Required if the system supports display
                         * switching (via hotkey).
                         */
                        Method (_DGS, 0, NotSerialized)
                        {
                            If (DVIN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        /*
                         * Device state set (active/ inactive)
                         *
                         * Required if the system supports display
                         * switching (via hotkey).
                         */
                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (LCDC)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        /*
                         * Query graphics state (active/ inactive)
                         *
                         * Required if the system supports display
                         * switching (via hotkey).
                         */
                        Method (_DGS, 0, NotSerialized)
                        {
                            If (LCDN)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        /*
                         * Device state set (active/ inactive)
                         *
                         * Required if the system supports display
                         * switching (via hotkey).
                         */
                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (TVO)
                    {
                        Name (_ADR, 0x0200)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (TV0C)
                            {
                                Return (0x1F)
                            }
                            Else
                            {
                                Return (0x1D)
                            }
                        }

                        /*
                         * Query graphics state (active/ inactive)
                         *
                         * Required if the system supports display
                         * switching (via hotkey).
                         */
                        Method (_DGS, 0, NotSerialized)
                        {
                            If (TV0N)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        /*
                         * Device state set (active/ inactive)
                         *
                         * Required if the system supports display
                         * switching (via hotkey).
                         */
                        Method (_DSS, 1, NotSerialized)
                        {
                        }

                        /*
                         * Return the EDID for this device
                         *
                         * Required if embedded LCD does not
                         * support return of EDID via standard
                         * interface
                         */
                        Method (_DDC, 1, NotSerialized)
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (\_SB.PCI0.EXP1.VGA.DDC3)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.EXP1.VGA.DDC3, \_SB.PCI0.EXP1.VGA.DDC0, Local0)
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

            Device (EXP2)
            {
                Name (_ADR, 0x00030000)
                OperationRegion (P2CS, PCI_Config, 0x40, 0xC0)
                Field (P2CS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x20), 
                    RID2,   16, 
                    PSP2,   1, 
                    PPP2,   1
                }

                /*
                 * Object that specifies the PCI interrupt routing table.
                 */
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
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
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
                                0x00, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)
                OperationRegion (PPPG, PCI_Config, 0x42, 0x01)
                Field (PPPG, ByteAcc, NoLock, Preserve)
                {
                        ,   5, 
                    CLK3,   1
                }

                /*
                 * Control method that puts the device in the D0
                 * device state (device fully on).
                 */
                Method (_PS0, 0, NotSerialized)
                {
                    Store (0x01, CLK3)
                }

                Method (_PS1, 0, NotSerialized)
                {
                    Store (0x00, CLK3)
                }

                Method (_PS2, 0, NotSerialized)
                {
                    Store (0x00, CLK3)
                }

                /*
                 * Control method that puts the device in the D4
                 * device state (device off).
                 */
                Method (_PS3, 0, NotSerialized)
                {
                    Store (0x00, CLK3)
                }

                /*
                 * Power management object that evaluates to the 
                 * device's power requirements in order to wake 
                 * the system from a system sleeping state.
                 */
                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x04
                })

                /*
                 * Object that specifies the PCI interrupt routing table.
                 */
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x07)
                        {
                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                0x00, 
                                0x17
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x01, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x02, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x03, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x04, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x15
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x07)
                        {
                            Package (0x04)
                            {
                                0x0007FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKH, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x04, 
                                \_SB.PCI0.LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKF, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (AUDO)
            {
                Name (_ADR, 0x00140005)
            }

            Device (MODM)
            {
                Name (_ADR, 0x00140006)

                /*
                 * Power management object that evaluates to the 
                 * device's power requirements in order to wake 
                 * the system from a system sleeping state.
                 */
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)

                /*
                 * Object that specifies the PCI interrupt routing table.
                 */
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                0x00, 
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
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00050000)
                    Name (SWIT, 0x01)
                    Name (CRTC, 0x01)
                    Name (LCDC, 0x01)
                    Name (TV0C, 0x00)
                    Name (DVIC, 0x01)
                    Name (CRTN, 0x01)
                    Name (LCDN, 0x01)
                    Name (TV0N, 0x00)
                    Name (DVIN, 0x01)
                    Method (VDEV, 0, NotSerialized)
                    {
                        GDST ()
                        If (LEqual (\VDSS, 0x00))
                        {
                            Store (0x00, Local0)
                            If (LEqual (CRTC, 0x01))
                            {
                                Store (0x02, Local0)
                            }

                            Increment (Local0)
                            If (LGreater (Local0, 0x04))
                            {
                                Store (0x01, Local0)
                            }

                            If (LAnd (Local0, 0x01))
                            {
                                Store (0x01, LCDN)
                            }

                            If (LAnd (Local0, 0x02))
                            {
                                Store (0x01, CRTN)
                            }

                            If (LAnd (Local0, 0x04))
                            {
                                Store (0x01, TV0N)
                            }
                        }

                        If (LEqual (\VDSS, 0x01))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x00, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x02))
                        {
                            Store (0x00, LCDN)
                            Store (0x01, CRTN)
                            Store (0x00, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x03))
                        {
                            Store (0x01, LCDN)
                            Store (0x01, CRTN)
                            Store (0x00, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x04))
                        {
                            Store (0x00, LCDN)
                            Store (0x00, CRTN)
                            Store (0x01, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x05))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x01, TV0N)
                            Store (0x00, DVIN)
                        }

                        If (LEqual (\VDSS, 0x06))
                        {
                            Store (0x00, LCDN)
                            Store (0x00, CRTN)
                            Store (0x00, TV0N)
                            Store (0x01, DVIN)
                        }

                        If (LEqual (\VDSS, 0x07))
                        {
                            Store (0x01, LCDN)
                            Store (0x00, CRTN)
                            Store (0x00, TV0N)
                            Store (0x01, DVIN)
                        }
                    }

                    Method (GDST, 0, NotSerialized)
                    {
                        Store (0x00, CRTC)
                        Store (0x00, LCDC)
                        Store (0x00, TV0C)
                        Store (0x00, DVIC)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        VDEV ()
                        Store (Arg0, Local0)
                        And (Local0, 0x01, SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x04)
                        {
                            0x0100, 
                            0x0210, 
                            0x0200, 
                            0x0110
                        })
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (CRTC)
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
                            If (CRTN)
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

                    Device (DVI)
                    {
                        Name (_ADR, 0x0210)
                        Method (_DCS, 0, NotSerialized)
                        {
                            If (DVIC)
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
                            If (DVIN)
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
                            If (LCDC)
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
                            If (LCDN)
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
                            If (TV0C)
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
                            If (TV0N)
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
                                Return (\_SB.PCI0.EXP1.VGA.DDC3)
                            }

                            If (LEqual (Arg0, 0x02))
                            {
                                Concatenate (\_SB.PCI0.EXP1.VGA.DDC3, \_SB.PCI0.EXP1.VGA.DDC0, Local0)
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
        }
    }
}

